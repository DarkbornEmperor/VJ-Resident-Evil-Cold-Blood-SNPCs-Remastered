AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/recb_zombie_male.mdl"} 
ENT.StartHealth = 150
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = 1
ENT.FlinchChance = 5
ENT.AnimTbl_Flinch = {ACT_FLINCH_CHEST}
ENT.HasMeleeAttack = true 
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
ENT.MeleeAttackDamage = 10
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 20 
ENT.MeleeAttackDamageDistance = 40
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 
ENT.GibOnDeathDamagesTable = {"All"}
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_recb/zombie/footstep1.wav","vj_recb/zombie/footstep2.wav","vj_recb/zombie/footstep3.wav"}
ENT.SoundTbl_Idle = {"vj_recb/zombie/male/male1/zom_idle.wav","vj_recb/zombie/male/male2/zom_idle.wav","vj_recb/zombie/male/male3/zom_idle.wav","vj_recb/zombie/male/male4/zom_idle.wav","vj_recb/zombie/male/male5/zom_idle.wav","vj_recb/zombie/male/male6/zom_idle.wav","vj_recb/zombie/male/male7/zom_idle.wav","vj_recb/zombie/male/male8/zom_idle.wav","vj_recb/zombie/male/male9/zom_idle.wav","vj_recb/zombie/male/male10/zom_idle.wav","vj_recb/zombie/male/male11/zom_idle.wav"}
ENT.SoundTbl_Alert = {"vj_recb/zombie/male/male1/zom_idle.wav","vj_recb/zombie/male/male2/zom_idle.wav","vj_recb/zombie/male/male3/zom_idle.wav","vj_recb/zombie/male/male4/zom_idle.wav","vj_recb/zombie/male/male5/zom_idle.wav","vj_recb/zombie/male/male6/zom_idle.wav","vj_recb/zombie/male/male7/zom_idle.wav","vj_recb/zombie/male/male8/zom_idle.wav","vj_recb/zombie/male/male9/zom_idle.wav","vj_recb/zombie/male/male10/zom_idle.wav","vj_recb/zombie/male/male11/zom_idle.wav"}
ENT.SoundTbl_Pain = {"vj_recb/zombie/male/male1/zom_pain.wav","vj_recb/zombie/male/male2/zom_pain.wav","vj_recb/zombie/male/male3/zom_pain.wav","vj_recb/zombie/male/male4/zom_idle.wav","vj_recb/zombie/male/male5/zom_pain.wav","vj_recb/zombie/male/male6/zom_pain.wav","vj_recb/zombie/male/male7/zom_pain.wav","vj_recb/zombie/male/male8/zom_pain.wav","vj_recb/zombie/male/male9/zom_pain.wav","vj_recb/zombie/male/male10/zom_pain.wav","vj_recb/zombie/male/male11/zom_pain.wav"}
ENT.SoundTbl_Death = {"vj_recb/zombie/male/male1/zom_die.wav","vj_recb/zombie/male/male2/zom_die.wav","vj_recb/zombie/male/male3/zom_die.wav","vj_recb/zombie/male/male4/zom_die.wav","vj_recb/zombie/male/male5/zom_die.wav","vj_recb/zombie/male/male6/zom_die.wav","vj_recb/zombie/male/male7/zom_die.wav","vj_recb/zombie/male/male8/zom_die.wav","vj_recb/zombie/male/male9/zom_die.wav","vj_recb/zombie/male/male10/zom_die.wav","vj_recb/zombie/male/male11/zom_die.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male1/zom_attack.wav","vj_recb/zombie/male/male2/zom_attack.wav","vj_recb/zombie/male/male3/zom_attack.wav","vj_recb/zombie/male/male4/zom_attack.wav","vj_recb/zombie/male/male5/zom_attack.wav","vj_recb/zombie/male/male6/zom_attack.wav","vj_recb/zombie/male/male7/zom_attack.wav","vj_recb/zombie/male/male8/zom_attack.wav","vj_recb/zombie/male/male9/zom_attack.wav","vj_recb/zombie/male/male10/zom_attack.wav","vj_recb/zombie/male/male11/zom_attack.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_recb/zombie/bite1.wav","vj_recb/zombie/bite2.wav"}
ENT.SoundTbl_RangeAttack = {"vj_recb/zombie/vomit.wav"}
ENT.SoundTbl_Impact = {"vj_recb/shared/hit_flesh1.wav","vj_recb/shared/hit_flesh2.wav","vj_recb/shared/hit_flesh3.wav","vj_recb/shared/hit_flesh4.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100

-- Custom
ENT.LegHealth = 20
ENT.Crippled = false
ENT.Vomit_Zombie = false
ENT.CanGetUp = true
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end		
    if key == "step" then
	    VJ_EmitSound(self, "vj_recb/zombie/footstep"..math.random(1,3)..".wav", 85, 100)	
end
	if key == "crawl" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
end
	if key == "vomit" then
		self:RangeAttackCode()
end
	if key == "death" then
		VJ_EmitSound(self, "vj_recb/zombie/zom_bodyfall"..math.random(1,2)..".wav", 85, 100)
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
if GetConVarNumber("VJ_RECB_Gibbing") == 0 then
        self.AllowedToGib = false 
        self.HasGibOnDeath = false 
        self.HasGibOnDeathSounds = false 
        self.HasGibDeathParticles = false
end
		if math.random(1,5) == 1 then
			self.Vomit_Zombie = true
	end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
local zombieskin = math.random(1,2)
    self:SetBodygroup(0,1)
	
    if zombieskin == 1 then
	self:SetSkin(math.random(0,3))
	
    elseif zombieskin == 2 then
	self:SetSkin(math.random(4,5))
	self:SetBodygroup(7,math.random(0,1))
end	
	if self.Vomit_Zombie then
	     self:SetVomitZombie()
   end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetVomitZombie()
    self.HasMeleeAttack = false 
	self.HasRangeAttack = true 
	self.AnimTbl_RangeAttack = {ACT_SPECIAL_ATTACK1}
	self.RangeAttackEntityToSpawn = "obj_vj_recb_zombie_vomit"
	self.RangeDistance = 100
    self.RangeToMeleeDistance = 1 
	self.TimeUntilRangeAttackProjectileRelease = false
	self.RangeUseAttachmentForPos = true 
    self.RangeUseAttachmentForPosID = "mouth"
	self.NextRangeAttackTime = 4
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1500)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
local attacker = dmginfo:GetAttacker()
if math.random(1,20) == 1 && !self.Crippled && GetConVarNumber("VJ_RECB_GetUp") == 1 then
self:VJ_ACT_PLAYACTIVITY("knocked_to_floor",true,100,false)
self.GodMode = true
self.VJ_NoTarget = true
self.DisableMakingSelfEnemyToNPCs = true
self.DisableChasingEnemy = true
self.DisableFindEnemy = true
self.DisableWandering = true
self.MovementType = VJ_MOVETYPE_STATIONARY
self.CanTurnWhileStationary = false
self.HasSounds = false
self.GodMode = true
self.CanFlinch = 0

timer.Simple(GetConVarNumber("VJ_RECB_Zombie_Time"),function()
if IsValid(self) && !self.Crippled && GetConVarNumber("VJ_RECB_GetUp") == 1 then
self:VJ_ACT_PLAYACTIVITY("getup",true,2.5,false)
self.GodMode = false
self.VJ_NoTarget = false
self.DisableMakingSelfEnemyToNPCs = false
self.DisableChasingEnemy = false
self.DisableFindEnemy = false
self.DisableWandering = false
self.HasSounds = true
self.GodMode = false

elseif IsValid(self) && self.Crippled == true && GetConVarNumber("VJ_RECB_GetUp") == 1 then
self:VJ_ACT_PLAYACTIVITY("crawl_attack",true,1,false)
self.GodMode = false
self.VJ_NoTarget = false
self.DisableMakingSelfEnemyToNPCs = false
self.DisableChasingEnemy = false
self.DisableFindEnemy = false
self.DisableWandering = false
self.HasSounds = true
self.GodMode = false
end

timer.Simple(3,function()
if IsValid(self) && !self.Crippled then
self.MovementType = VJ_MOVETYPE_GROUND
self.CanFlinch = 1

elseif IsValid(self) && self.Crippled == true then
self.MovementType = VJ_MOVETYPE_GROUND
self.CanFlinch = 0
end
end)
end)
end
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	--if self.Damaged == false then --(dmginfo:IsBulletDamage())
		local attacker = dmginfo:GetAttacker()	
		if math.random(1,10) == 1 && hitgroup == HITGROUP_HEAD then
		self:EmitSound(Sound("vj_recb/zombie/zom_neck_break.wav",70))
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())	
        self:SetBodygroup(0,0)		
		self:SetBodygroup(1,2)
		self:SetBodygroup(7,0)
	
		elseif math.random(1,10) == 1 && hitgroup == HITGROUP_CHEST then
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("chest")).Pos,self:GetAngles())
		self:EmitSound(Sound("vj_recb/zombie/zom_armlost.wav",70))
		self:SetBodygroup(0,0)
		self:SetBodygroup(4,1)
	
		elseif math.random(1,10) == 1 && hitgroup == HITGROUP_RIGHTARM then
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("rarm")).Pos,self:GetAngles())
		self:EmitSound(Sound("vj_recb/zombie/zom_armlost.wav",70))
		self:SetBodygroup(0,0)
		self:SetBodygroup(5,1)

		elseif math.random(1,10) == 1 && hitgroup == HITGROUP_LEFTARM then
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("larm")).Pos,self:GetAngles())
		self:EmitSound(Sound("vj_recb/zombie/zom_armlost.wav",70))
		self:SetBodygroup(0,0)
		self:SetBodygroup(6,1)
   end
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_OnBleed(dmginfo,hitgroup)
	if !self.Crippled then
		local legs = {6,7}
		if VJ_HasValue(legs,hitgroup) then
			self.LegHealth = self.LegHealth -dmginfo:GetDamage()
			if self.LegHealth <= 0 then
				self.Crippled = true
				local anim = ACT_FLINCH_PHYSICS
				if hitgroup == HITGROUP_LEFTLEG then
				    ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("lleg")).Pos,self:GetAngles())
					self:SetBodygroup(3,1)
				elseif hitgroup == HITGROUP_RIGHTLEG then
				    ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("rleg")).Pos,self:GetAngles())
					self:SetBodygroup(2,1)
				end
				if math.random(1,4) == 1 then anim = ACT_FLINCH_PHYSICS end
				self:SetBodygroup(0,0)
				self:VJ_ACT_PLAYACTIVITY(anim,true,false,true)
				self:EmitSound(Sound("vj_recb/zombie/zom_leglost.wav",70))
				self:Cripple()
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Cripple()
	self:SetHullType(HULL_TINY)
	self:SetCollisionBounds(Vector(16,16,20),Vector(-16,-16,0))
	self.SoundTbl_FootStep = {"vj_recb/zombie/crawl.wav"}
	self.AnimTbl_IdleStand = {ACT_IDLE_STIMULATED}
	self.AnimTbl_Walk = {ACT_WALK_STIMULATED}
	self.AnimTbl_Run = {ACT_WALK_STIMULATED}
	self.MeleeAttackDamage = self.MeleeAttackDamage /2
	self.MaxJumpLegalDistance = VJ_Set(0,0)
	self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2}
	self:CapabilitiesRemove(bit.bor(CAP_MOVE_JUMP))
	self:CapabilitiesRemove(bit.bor(CAP_MOVE_CLIMB))	
	self.CanFlinch = 0
	self.HasRangeAttack = false
	self.HasMeleeAttack = true 
	self.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(30, 25, -15), 
	FirstP_Bone = "ValveBiped.Bip01_Head1", 
	FirstP_Offset = Vector(10, 0, -30), 
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 then
	    self:EmitSound(Sound("vj_recb/zombie/zom_headburst.wav",70))
		self:SetBodygroup(0,0)
		self:SetBodygroup(1,3)
		self:SetBodygroup(7,0)
	
		if self.HasGibDeathParticles == true then
			for i=1,3 do
				ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
				ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
				ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
				
		local bloodeffect = ents.Create("info_particle_system")
		bloodeffect:SetKeyValue("effect_name","blood_advisor_pierce_spray")
		bloodeffect:SetPos(self:GetAttachment(self:LookupAttachment("head")).Pos)
		bloodeffect:SetAngles(self:GetAttachment(self:LookupAttachment("head")).Ang)
		bloodeffect:SetParent(self)
		bloodeffect:Fire("SetParentAttachment","head")
		bloodeffect:Spawn()
		bloodeffect:Activate()
		bloodeffect:Fire("Start","",0)
		bloodeffect:Fire("Kill","",2)	
				
	end
end
		return true,{DeathAnim=true}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
	if hitgroup == HITGROUP_HEAD && !self.Crippled then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
	else
		self.AnimTbl_Death = {ACT_DIEFORWARD,ACT_DIESIMPLE}
end
	if self.Crippled == true then
	self.AnimTbl_Death = {ACT_DIE_BACKSHOT}
end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/