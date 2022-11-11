/* Note: All credits go to Cpt. Hazama. I take no credit for this. */
AddCSLuaFile("shared.lua")
include('shared.lua')

local table_insert = table.insert
local table_remove = table.remove

ENT.Zombie = {
	{class="npc_vj_recb_zombie_male",chance=1},
	{class="npc_vj_recb_zombie_female",chance=1},
	{class="npc_vj_recb_zombie_soldier",chance=8},
	{class="npc_vj_recb_zombie_priest",chance=2},	
	{class="npc_vj_recb_zombie_resear",chance=2},
	{class="npc_vj_recb_zombie_torso",chance=5},
	{class="npc_vj_recb_crimsonhead",chance=15},
	{class="npc_vj_recb_crimsonhead_resear",chance=15},
	{class="npc_vj_recbb1_zombie_male",chance=5},	
	{class="npc_vj_recbb1_zombie_female",chance=5},
	{class="npc_vj_recbb1_zombie_hunk",chance=8}, 
	{class="npc_vj_recbb1_zombie_torso",chance=5},
	{class="npc_vj_recb_cerberus",chance=10},
	{class="npc_vj_recbb3_cerberus",chance=10},
	{class="npc_vj_recb_hunter",chance=15},
	{class="npc_vj_recbb3_hunter",chance=15},
	{class="npc_vj_recb_licker",chance=15},
	{class="npc_vj_recb_spider_giant",chance=25},
	{class="npc_vj_recb_spider_small",chance=15},
	{class="npc_vj_recb_crawler",chance=15},
	{class="npc_vj_recb_snake",chance=10},
	{class="npc_vj_recb_ant",chance=15},
	{class="npc_vj_recb_flyclaw",chance=15},
	{class="npc_vj_recb_pursuer",chance=15},
	{class="npc_vj_recb_crow",chance=10},	
}

ENT.SpecialZombie = {
	{class="npc_vj_recb_tyrant",max=1},
	{class="npc_vj_recb_spider_blacktiger",max=1},
	{class="npc_vj_recb_prototyrant",max=1}, 	
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Initialize()
	local i = 0
	for k, v in ipairs(ents.GetAll()) do
		if v:GetClass() == "sent_vj_recb_mapspawner" then
			i = i + 1
			if i > 1 then PrintMessage(HUD_PRINTTALK, "Only one Map Spawner is allowed on the map.") self.SkipOnRemove = true self:Remove() return end
		end
	end

	self.nodePositions = {}
	self.navAreas = {}
	
	for _,pos in pairs(VJ_RECB_NODEPOS) do
		if pos then table_insert(self.nodePositions,{Position = pos, Time = 0}) end
	end

	for _,nav in pairs(navmesh.GetAllNavAreas()) do
		if nav then table_insert(self.navAreas,nav) end
	end

	local count = #self.nodePositions +#self.navAreas
	if count <= 50 then
		local msg = "Low node/nav-area count detected! The Map Spawner may find it difficult to process with such low nodes/nav-areas...removing..."
		if count <= 0 then
			msg = "No nodes or nav-mesh detected! The Map Spawner relies on nodes/nav-areas for many things. Without any, the Map Spawner will not work! The Map Spawner will now remove itself..."
		end
		MsgN(msg)
		if IsValid(self:GetCreator()) then
			self:GetCreator():ChatPrint(msg)
		end
		SafeRemoveEntity(self)
		return
	end

	self:SetCollisionGroup(COLLISION_GROUP_NONE)
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_NONE)
	self:SetPos(Vector(0, 0, 0))
	self:SetNoDraw(true)
	self:DrawShadow(false)
	
	self.IsActivated = tobool(GetConVarNumber("VJ_RECB_MapSpawner_Enabled"))
	self.RECB_SpawnDistance = GetConVarNumber("VJ_RECB_MapSpawner_SpawnMax")
	self.RECB_SpawnDistanceClose = GetConVarNumber("VJ_RECB_MapSpawner_SpawnMin")
	self.RECB_HordeChance = GetConVarNumber("VJ_RECB_MapSpawner_HordeChance")
	self.RECB_HordeCooldownMin = GetConVarNumber("VJ_RECB_MapSpawner_HordeCooldownMin")
	self.RECB_HordeCooldownMax = GetConVarNumber("VJ_RECB_MapSpawner_HordeCooldownMax")
	self.RECB_MaxZombie = GetConVarNumber("VJ_RECB_MapSpawner_MaxZom")
	self.RECB_MaxHordeSpawn = GetConVarNumber("VJ_RECB_MapSpawner_HordeCount")
	self.tbl_SpawnedNPCs = {}
	self.tbl_NPCsWithEnemies = {}
	self.tbl_SpawnedSpecialZombie = {}
	self.NextAICheckTime = CurTime() +5
	self.NextZombieSpawnTime = CurTime() +1
	self.NextSpecialZombieSpawnTime = CurTime() +math.random(4,20)
	self.NextHordeSpawnTime = CurTime() +math.Rand(self.RECB_HordeCooldownMin,self.RECB_HordeCooldownMax)
	self.NextAIBossCheckTime = CurTime() +5
	self.HordeSpawnRate = 0.19
	self.MaxSpecialZombie = 1
	self.CanSpawnSpecialZombie = true --GetConVarNumber("VJ_RECB_MapSpawner_Boss")

 local Ambience = {"vj_recb/mapspawner/residentevil.wav"}
 local Music = {"vj_recb/mapspawner/mall_music.wav"}
	for _,v in ipairs(player.GetAll()) do
     if GetConVar("VJ_RECB_MapSpawner_Ambient"):GetInt() == 1 then 	 			
             self.RECB_Ambience = VJ_CreateSound(v,Ambience,GetConVarNumber("VJ_RECB_MapSpawner_AmbienceVolume"), 100)  
end			 
     if GetConVar("VJ_RECB_MapSpawner_Music"):GetInt() == 1 then
             self.RECB_Music = VJ_CreateSound(v,Music,GetConVarNumber("VJ_RECB_MapSpawner_MusicVolume"), 100)    			 
		end	
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CheckVisibility(pos,ent,mdl)
	local check = ents.Create("prop_vj_animatable")
	check:SetModel(mdl or "models/vj_recb/zombie_male.mdl")
	check:SetPos(pos)
	check:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	check:Spawn()
	check:SetNoDraw(true)
	check:DrawShadow(false)
	self:DeleteOnRemove(check)
	timer.Simple(0,function()
		SafeRemoveEntity(check)
	end)

	return ent:Visible(check)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindCenterNavPoint(ent)
	for _,v in RandomPairs(self.navAreas) do
		local testPos = v:GetCenter()
		local dist = testPos:Distance(ent:GetPos())
		if dist <= self.RECB_SpawnDistance && dist >= self.RECB_SpawnDistanceClose && !self:CheckVisibility(testPos,ent) then
			return testPos
		end
	end
	return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindHiddenNavPoint(ent)
	for _,v in RandomPairs(self.navAreas) do
		local hidingSpots = v:GetHidingSpots()
		if !hidingSpots then continue end
		if #hidingSpots <= 0 then continue end
		local testPos = VJ_PICK(hidingSpots)
		local dist = testPos:Distance(ent:GetPos())
		if dist <= self.RECB_SpawnDistance && dist >= self.RECB_SpawnDistanceClose && !self:CheckVisibility(testPos,ent) then
			return testPos
		end
	end
	return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindRandomNavPoint(ent)
	for _,v in RandomPairs(self.navAreas) do
		local testPos = v:GetRandomPoint()
		local dist = testPos:Distance(ent:GetPos())
		if dist <= self.RECB_SpawnDistance && dist >= self.RECB_SpawnDistanceClose && !self:CheckVisibility(testPos,ent) then
			return testPos
		end
	end
	return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetClosestNavPosition(ent,getHidden)
	local pos = false
	local closestDist = 999999999
	for i,v in pairs(self.navAreas) do
		local hidingSpots = getHidden && v:GetHidingSpots() or true
		if !hidingSpots then continue end
		if istable(hidingSpots) && #hidingSpots <= 0 then continue end
		local testPos = getHidden && VJ_PICK(v:GetHidingSpots()) or v:GetRandomPoint()
		local dist = ent:GetPos():Distance(testPos)
		if dist < closestDist && (dist <= self.RECB_SpawnDistance && dist >= self.RECB_SpawnDistanceClose && !self:CheckVisibility(testPos,ent)) then
			closestDist = dist
			pos = testPos
		end
	end
	return pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetClosestNodePosition(ent)
	local pos = false
	local closestDist = 999999999
	for i,v in pairs(self.nodePositions) do
		if !self:IsNodeUsable(i) then continue end
		local testPos = self:GetNodePosition(i)
		local dist = ent:GetPos():Distance(testPos)
		if dist < closestDist && (dist <= self.RECB_SpawnDistance && dist >= self.RECB_SpawnDistanceClose && !self:CheckVisibility(testPos,ent)) then
			closestDist = dist
			pos = testPos
		end
	end
	return pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindRandomNodePosition(ent)
	for i,v in RandomPairs(self.nodePositions) do
		if !self:IsNodeUsable(i) then continue end
		local testPos = self:GetNodePosition(i)
		local dist = ent && testPos:Distance(ent:GetPos()) or 0
		if ent then
			return testPos
		else
			if dist <= self.RECB_SpawnDistance && dist >= self.RECB_SpawnDistanceClose && !self:CheckVisibility(testPos,ent) then
				return testPos
			end
		end
	end
	return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindSpawnPosition(getClosest,findHidden)
	local nodes = self.nodePositions
	local navareas = self.navAreas
	local useNav = (#nodes <= 0 && #navareas > 0) or (#navareas > 0 && #nodes > 0 && math.random(1,2) == 1) or false
	local pos = false
	
	if useNav then
		local getHidden = findHidden or math.random(1,3) == 1
		local testEnt = self:GetRandomEnemy()
		pos = getClosest && self:GetClosestNavPosition(testEnt,getHidden) or getHidden && self:FindHiddenNavPoint(testEnt) or self:FindRandomNavPoint(testEnt)
	else
		local testEnt = self:GetRandomEnemy()
		pos = getClosest && self:GetClosestNodePosition(testEnt) or self:FindRandomNodePosition(testEnt)
	end
	return pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetNodePosition(i)
	return self.nodePositions[i].Position
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:IsNodeUsable(i)
	return self.nodePositions[i].Time < CurTime()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindEnemy()
	local tbl = {}
	for _,v in pairs(ents.GetAll()) do
		if (v:IsPlayer() || v:IsNPC()) && v:Health() > 0 && !v:IsFlagSet(65536) && (v.VJ_NPC_Class && !VJ_HasValue(v.VJ_NPC_Class,"CLASS_ZOMBIE") or true) then
			table_insert(tbl,v)
		end
	end
	return tbl
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetRandomEnemy()
	return VJ_PICK(self:FindEnemy())
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetClosestEnemy(pos)
	local ent = NULL
	local closestDist = 999999999
	for _,v in pairs(self:FindEnemy()) do
		local dist = v:GetPos():Distance(pos)
		if dist < closestDist then
			closestDist = dist
			ent = v
		end
	end
	return ent
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CheckEnemyDistance(ent,remove)
	local remove = remove or true
	local closestDist = 999999999
	local visible = false
	for _,v in pairs(self:FindEnemy()) do
		local dist = v:GetPos():Distance(ent:GetPos())
		if dist < closestDist then
			closestDist = dist
		end
		if v:Visible(ent) then
			visible = true -- Visible to someone, don't bother removing
		end
	end
	if closestDist >= GetConVarNumber("VJ_RECB_MapSpawner_SpawnMax") +1000 && !visible && !remove then
		SafeRemoveEntity(ent)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Think()
	self.IsActivated = GetConVar("VJ_RECB_MapSpawner_Enabled")
	if self.IsActivated then 
		-- Manage ConVar data
	    self.RECB_SpawnDistance = GetConVarNumber("VJ_RECB_MapSpawner_SpawnMax")
	    self.RECB_SpawnDistanceClose = GetConVarNumber("VJ_RECB_MapSpawner_SpawnMin")
	    self.RECB_HordeChance = GetConVarNumber("VJ_RECB_MapSpawner_HordeChance")
	    self.RECB_HordeCooldownMin = GetConVarNumber("VJ_RECB_MapSpawner_HordeCooldownMin")
	    self.RECB_HordeCooldownMax = GetConVarNumber("VJ_RECB_MapSpawner_HordeCooldownMax")
	    self.RECB_MaxZombie = GetConVarNumber("VJ_RECB_MapSpawner_MaxZom")
	    self.RECB_MaxHordeSpawn = GetConVarNumber("VJ_RECB_MapSpawner_HordeCount")
		self.AI_RefreshTime = GetConVarNumber("VJ_RECB_MapSpawner_RefreshRate") 
		
		-- Checks for inactive AI, this code is quite bulky and might be able to be optimized better
		if CurTime() > self.NextAICheckTime then
			if #self.tbl_SpawnedNPCs > 0 then
				for i,v in ipairs(self.tbl_SpawnedNPCs) do
					if IsValid(v) then
						local enemy = v:GetEnemy()
						self:CheckEnemyDistance(v)
						if IsValid(enemy) && !VJ_HasValue(self.tbl_NPCsWithEnemies,v) then
							table_insert(self.tbl_NPCsWithEnemies,v)
						elseif !IsValid(enemy) then
							if VJ_HasValue(self.tbl_NPCsWithEnemies,v) then
								table_remove(self.tbl_NPCsWithEnemies,i)
							end
						end
					else
						table_remove(self.tbl_SpawnedNPCs,i)
					end
				end
			end
			if #self.tbl_SpawnedSpecialZombie > 0 then
				for i,v in ipairs(self.tbl_SpawnedSpecialZombie) do
					if IsValid(v) then
						local enemy = v:GetEnemy()
						self:CheckEnemyDistance(v)
						if IsValid(enemy) && !VJ_HasValue(self.tbl_NPCsWithEnemies,v) then
							table_insert(self.tbl_NPCsWithEnemies,v)
						elseif !IsValid(enemy) then
							if VJ_HasValue(self.tbl_NPCsWithEnemies,v) then
								table_remove(self.tbl_NPCsWithEnemies,i)
							end	
						end
					else
						table_remove(self.tbl_SpawnedSpecialZombie,i)
					end
				end
			end
			self.NextAICheckTime = CurTime() +5
		end

		-- Spawns AI		
		if CurTime() > self.NextZombieSpawnTime then
			if #self.tbl_SpawnedNPCs >= self.RECB_MaxZombie -self.RECB_MaxHordeSpawn then return end -- Makes sure that we can at least spawn a mob when it's time
			self:SpawnZombie(self:PickZombie(self.Zombie),self:FindSpawnPosition(false))
			self.NextZombieSpawnTime = CurTime() +math.Rand(GetConVarNumber("VJ_RECB_MapSpawner_DelayMin"),GetConVarNumber("VJ_RECB_MapSpawner_DelayMax"))
end

		if GetConVarNumber("VJ_RECB_MapSpawner_Specials") == 0 then return end
			if CurTime() > self.NextSpecialZombieSpawnTime then
				self:SpawnSpecialZombie(self:PickZombie(self.SpecialZombie),self:FindSpawnPosition(true))
				self.NextSpecialZombieSpawnTime = CurTime() +math.Rand(4,20)
end		
		-- Spawns Hordes
		if CurTime() > self.NextHordeSpawnTime && math.random(1,self.RECB_HordeChance) == 1 then
			for i = 1,self.RECB_MaxHordeSpawn do
				timer.Simple(self.HordeSpawnRate *i,function() -- Help with lag when spawning
					if IsValid(self) then
						self:SpawnZombie(self:PickZombie(self.Zombie),self:FindSpawnPosition(true,true),true)			
					end
				end)
			end			
			self.NextHordeSpawnTime = CurTime() +math.Rand(self.RECB_HordeCooldownMin,self.RECB_HordeCooldownMax)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetBossCount(class)
	local count = 0
	for _,v in pairs(self.tbl_SpawnedSpecialZombie) do
		if IsValid(v) && v:GetClass() == class then
			count = count +1
		end
	end
	return count
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PickZombie(tbl)
	local useMax = tbl == self.SpecialZombie
	local ent = false
	for _,v in RandomPairs(tbl) do
		if !useMax then
			if math.random(1,v.chance) == 1 then
				ent = v.class
				break
			end
		else
			if self:GetBossCount(v.class) < v.max then
				ent = v.class
				break
			end
		end
	end
	return ent
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SpawnZombie(ent,pos,isMob)
	if ent == false then return end
	if pos == nil or pos == false then return end
	if #self.tbl_SpawnedNPCs >= self.RECB_MaxZombie then return end
	local Zombie = ents.Create(ent)
	Zombie:SetPos(pos)
	Zombie:SetAngles(Angle(0,math.random(0,360),0))
	Zombie:Spawn()
	table_insert(self.tbl_SpawnedNPCs,Zombie)
/*
	if isMob then
		Zombie.FindEnemy_UseSphere = true
		Zombie.FindEnemy_CanSeeThroughWalls = true
		Zombie:DrawShadow(false)
		timer.Simple(0,function()
			if IsValid(Zombie) then
				Zombie:DrawShadow(false)
			end
		end)
	end
*/
	Zombie.MapSpawner = self
	Zombie.EntitiesToNoCollide = {}
	for _,v in pairs(self.Zombie) do
		table_insert(Zombie.EntitiesToNoCollide,v.class)
end	
	for _,v in pairs(self.SpecialZombie) do
		table_insert(Zombie.EntitiesToNoCollide,v.class)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SpawnSpecialZombie(ent,pos)
	if ent == false then return end
	if pos == nil or pos == false then return end
	if #self.tbl_SpawnedSpecialZombie >= self.MaxSpecialZombie then return end

	local Boss = ents.Create(ent)
	Boss:SetPos(pos)
	Boss:SetAngles(Angle(0,math.random(0,360),0))
	Boss:Spawn()
	table_insert(self.tbl_SpawnedSpecialZombie,Boss)
	Boss.MapSpawner = self
	Boss.EntitiesToNoCollide = {}
	for _,v in pairs(self.SpecialZombie) do
		table_insert(Boss.EntitiesToNoCollide,v.class)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRemove()
    VJ_STOPSOUND(self.RECB_Ambience)
	VJ_STOPSOUND(self.RECB_Music)
	for index,object in ipairs(self.tbl_SpawnedNPCs) do
		if IsValid(object) then
			object:Remove()
		end
	end
	for index,object in ipairs(self.tbl_SpawnedSpecialZombie) do
		if IsValid(object) then
			object:Remove()
		end
	end
end