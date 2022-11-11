AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/zombie_crimsonhead.mdl"} 
ENT.StartHealth = 250
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.PoseParameterLooking_Names = {pitch={}, yaw={"head"}, roll={}}
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_FLINCH_CHEST}
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 20
ENT.NextMeleeAttackTime = 1.5
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.HasMeleeAttackSlowPlayerSound = false
ENT.SlowPlayerOnMeleeAttack_WalkSpeed = 0.01
ENT.SlowPlayerOnMeleeAttack_RunSpeed = 0.01
ENT.SlowPlayerOnMeleeAttackTime = 1.7
ENT.MeleeAttackKnockBack_Forward1 = -100
ENT.MeleeAttackKnockBack_Forward2 = -100
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 
ENT.GibOnDeathDamagesTable = {"All"}
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(40, 25, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_recb/zombie/footstep1.wav","vj_recb/zombie/footstep2.wav","vj_recb/zombie/footstep3.wav"}
ENT.SoundTbl_Impact = {"vj_recb/shared/hit_flesh1.wav","vj_recb/shared/hit_flesh2.wav","vj_recb/shared/hit_flesh3.wav","vj_recb/shared/hit_flesh4.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100

-- Custom
ENT.HeadHealth = 10
ENT.ChestHealth = 25
ENT.RArmHealth = 15
ENT.LArmHealth = 20
ENT.LegHealth = 20
ENT.Crippled = false
ENT.HasBeenKnocked = false
ENT.CanBeKnocked = true
ENT.NextKnockTimeT = 0
ENT.Head_Damaged = false
ENT.Chest_Damaged = false
ENT.RArm_Damaged = false
ENT.LArm_Damaged = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
    if key == "step_getup" then
	    VJ_EmitSound(self, "vj_recb/zombie/footstep"..math.random(1,3)..".wav", 70, 100)	
end
	if key == "crawl" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
end
	if key == "death" then
		VJ_EmitSound(self, "vj_recb/zombie/zom_bodyfall"..math.random(1,2)..".wav", 75, 100)
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:ZombieVoices()	
    self:Zombie_CustomOnInitialize()	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
     local zombieskin = math.random(1,2)
        self:SetBodygroup(0,1)	
     if zombieskin == 1 then
	   self:SetSkin(math.random(0,3))
     elseif zombieskin == 2 && math.random(1,3) == 1 then
	   self:SetSkin(math.random(4,5))
	   self:SetBodygroup(7,math.random(0,1))
	end
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoices()
 local voice = math.random(1,2)
     if voice == 1 then
       self.SoundTbl_Breath = {"vj_recb/zombie/crimsonhead/crimhead_run.wav"}
       self.SoundTbl_Alert = {"vj_recb/zombie/CrimsonHead/crimhead_alert.wav"}
       self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/CrimsonHead/crimhead_attack1.wav","vj_recb/zombie/CrimsonHead/crimhead_attack2.wav"}
       self.SoundTbl_MeleeAttackExtra = {"vj_recb/zombie/CrimsonHead/crimhead_slash.wav"}
       self.SoundTbl_MeleeAttackMiss = {"vj_recb/shared/claw_miss1.wav","vj_recb/shared/claw_miss2.wav"}
       self.SoundTbl_Pain = {"vj_recb/zombie/CrimsonHead/crimhead_pain.wav"}
       self.SoundTbl_Death = {"vj_recb/zombie/CrimsonHead/crimhead_die.wav"}

       elseif voice == 2 then
       self.SoundTbl_Idle = {"vj_recb/zombie/crimsonhead2/crimhead_run.wav"}
       self.SoundTbl_Alert = {"vj_recb/zombie/crimsonhead2/crimhead_alert.wav"}
       self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/crimsonhead2/crimhead_attack1.wav","vj_recb/zombie/crimsonhead2/crimhead_attack2.wav"}
       self.SoundTbl_MeleeAttackExtra = {"vj_recb/zombie/crimsonhead2/crimhead_slash.wav"}
       self.SoundTbl_MeleeAttackMiss = {"vj_recb/shared/claw_miss1.wav","vj_recb/shared/claw_miss2.wav"}
       self.SoundTbl_Pain = {"vj_recb/zombie/crimsonhead2/crimhead_pain.wav"}
       self.SoundTbl_Death = {"vj_recb/zombie/crimsonhead2/crimhead_die.wav"}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed) 
     if self.Crippled then  
	    self.MeleeAttackDamage = self.MeleeAttackDamage /2
	    self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2}
		self.HasMeleeAttackKnockBack = true
		self.SlowPlayerOnMeleeAttack = true
        self.SoundTbl_MeleeAttackExtra = {"vj_recb/zombie/bite1.wav","vj_recb/zombie/bite2.wav"} 
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFlinch_BeforeFlinch(dmginfo,hitgroup)
    return !self.Crippled && self:GetSequence() != self:LookupSequence("knocked_to_floor") && self:GetSequence() != self:LookupSequence("getup") -- If we are crawling then DO NOT flinch!		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
  if GetConVar("VJ_RECB_Dismember"):GetInt() == 0 or self.DeathAnimationCodeRan then return end	 
	local AnimTime = VJ_GetSequenceDuration(self,self:GetSequenceName(self:GetSequence()))
    if self.CanBeKnocked && !self.HasBeenKnocked && math.random(1,10) == 1 && CurTime() > self.NextKnockTimeT && !self.Crippled then
       self:VJ_ACT_PLAYACTIVITY("knocked_to_floor",true,false,false)
       self.MovementType = VJ_MOVETYPE_STATIONARY
	   self.CanTurnWhileStationary = false
	   self.HasPoseParameterLooking = false
	   self.CallForHelp = false
       self.HasBeenKnocked = true
       self.CanBeKnocked = false
       self:AddFlags(FL_NOTARGET)
       self.HasIdleSounds = false
	   self.HasBreathSound = false
	   self.DisableSelectSchedule = true
       self.DisableFindEnemy = true		
       self.DisableMakingSelfEnemyToNPCs = true
	   self.HasMeleeAttack = false
	   self.CanFlinch = 0

    timer.Simple(math.random(GetConVar("VJ_RECB_Zombie_GetUpTime1"):GetInt(),GetConVar("VJ_RECB_Zombie_GetUpTime2"):GetInt()),function()
    if IsValid(self) && !self.DeathAnimationCodeRan then
    if !self.Crippled then
       self:VJ_ACT_PLAYACTIVITY("getup",true,false,false)
	   AnimTime = VJ_GetSequenceDuration(self,"getup")

    elseif self.Crippled then
       self:VJ_ACT_PLAYACTIVITY("crawl_attack",true,false,false)
       self:SetCollisionBounds(Vector(13,13,25),Vector(-13,-13,0))
	   AnimTime = VJ_GetSequenceDuration(self,"crawl_attack")
end
	   self.HasPoseParameterLooking = true
	   self.CallForHelp = true
       self.HasBeenKnocked = false
       self:RemoveFlags(FL_NOTARGET)
       self.HasIdleSounds = true
	   self.HasBreathSound = true
       self.NextKnockTimeT = CurTime() + math.random(5,8) 	   
end	   
       timer.Simple(AnimTime,function()
       if IsValid(self) && !self.DeathAnimationCodeRan then
       if !self.Crippled then 
	      self.CanFlinch = 1       

       elseif self.Crippled then
	      self.CanBeKnocked = false
          self.CanFlinch = 0
end
	      self.MovementType = VJ_MOVETYPE_GROUND
		  self.DisableSelectSchedule = false
          self.DisableFindEnemy = false		
          self.DisableMakingSelfEnemyToNPCs = false
	      self.HasMeleeAttack = true
                end		  
            end)
        end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_OnBleed(dmginfo,hitgroup)
    if GetConVar("VJ_RECB_Dismember"):GetInt() == 0 then return end
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
				self:VJ_ACT_PLAYACTIVITY(anim,true,false,false)
				VJ_EmitSound(self,"vj_recb/zombie/zom_leglost.wav",75,100)
		        self:RemoveAllDecals()
				self:Cripple()
		end
	end
end
	 local head = {1} -- Head
	 local chest = {2} -- Chest
	 local rarm = {5} -- Right Arm
	 local larm = {4} -- Left Arm
	 if VJ_HasValue(head,hitgroup) then
		self.HeadHealth = self.HeadHealth -dmginfo:GetDamage()		
	 if !self.Head_Damaged && hitgroup == HITGROUP_HEAD && self.HeadHealth <= 0 then
		self.Head_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())	
		VJ_EmitSound(self,"vj_recb/zombie/zom_neck_break.wav",75,100)
        self:SetBodygroup(0,0)		
		self:SetBodygroup(1,2)
		self:SetBodygroup(7,0)
		self:RemoveAllDecals()
	end
end	
	 if VJ_HasValue(chest,hitgroup) then
		self.ChestHealth = self.ChestHealth -dmginfo:GetDamage()		
	 if !self.Chest_Damaged && hitgroup == HITGROUP_CHEST && self.ChestHealth <= 0 then
		self.Chest_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("chest")).Pos,self:GetAngles())
		VJ_EmitSound(self,"vj_recb/zombie/zom_armlost.wav",75,100)
		self:SetBodygroup(0,0)
		self:SetBodygroup(4,1)
		self:RemoveAllDecals()
	end
end
	 if VJ_HasValue(rarm,hitgroup) then
		self.RArmHealth = self.RArmHealth -dmginfo:GetDamage()	
	 if !self.RArm_Damaged && hitgroup == HITGROUP_RIGHTARM && self.RArmHealth <= 0 then
		self.RArm_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("rarm")).Pos,self:GetAngles())
		VJ_EmitSound(self,"vj_recb/zombie/zom_armlost.wav",75,100)
		self:SetBodygroup(0,0)
		self:SetBodygroup(5,1)
		self:RemoveAllDecals()
	end
end
	 if VJ_HasValue(larm,hitgroup) then
		self.LArmHealth = self.LArmHealth -dmginfo:GetDamage()	
	 if !self.LArm_Damaged && hitgroup == HITGROUP_LEFTARM && self.LArmHealth <= 0 then
		self.LArm_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("larm")).Pos,self:GetAngles())
		VJ_EmitSound(self,"vj_recb/zombie/zom_armlost.wav",75,100)
		self:SetBodygroup(0,0)
		self:SetBodygroup(6,1)
		self:RemoveAllDecals()
		end
	end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Cripple()
	self:SetHullType(HULL_TINY)
	self:SetCollisionBounds(Vector(13,13,25),Vector(-13,-13,0))
	self.SoundTbl_FootStep = {"vj_recb/zombie/crawl.wav"}
	self.AnimTbl_IdleStand = {ACT_IDLE_STIMULATED}
	self.AnimTbl_Walk = {ACT_WALK_STIMULATED}
	self.AnimTbl_Run = {ACT_WALK_STIMULATED}
	self.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(30, 25, -15), 
	FirstP_Bone = "ValveBiped.Bip01_Head1", 
	FirstP_Offset = Vector(10, 0, -30), 
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    if GetConVar("VJ_RECB_Gib"):GetInt() == 0 then return end
	if dmginfo:GetDamageForce():Length() < 800 then return end
	if hitgroup == HITGROUP_HEAD then
	    VJ_EmitSound(self,"vj_recb/zombie/zom_headburst.wav",75,100)
		self:SetBodygroup(0,0)
		self:SetBodygroup(1,3)
		self:SetBodygroup(7,0)
        self.HasDeathSounds = false
		self:RemoveAllDecals()
	
	 if self.HasGibDeathParticles then
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
				
		local BloodEffect = ents.Create("info_particle_system")
		BloodEffect:SetKeyValue("effect_name","blood_advisor_pierce_spray")
		BloodEffect:SetPos(self:GetAttachment(self:LookupAttachment("head")).Pos)
		BloodEffect:SetAngles(self:GetAttachment(self:LookupAttachment("head")).Ang)
		BloodEffect:SetParent(self)
		BloodEffect:Fire("SetParentAttachment","head")
		BloodEffect:Spawn()
		BloodEffect:Activate()
		BloodEffect:Fire("Start","",0)
		BloodEffect:Fire("Kill","",5)					
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	 if hitgroup == HITGROUP_HEAD && !self.Crippled then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
	else
		self.AnimTbl_Death = {ACT_DIEFORWARD,ACT_DIESIMPLE}
end
	 if self.Crippled then
	    self.AnimTbl_Death = {"crawl_die"}
    end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/