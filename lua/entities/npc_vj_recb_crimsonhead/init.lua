AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/zombie_crimsonhead.mdl"} 
ENT.StartHealth = 200
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
ENT.MeleeAttackDistance = 25 
ENT.MeleeAttackDamageDistance = 55
ENT.HasMeleeAttackKnockBack = false
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 
ENT.GibOnDeathDamagesTable = {"All"}
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(40, 20, -50), -- The offset for the controller when the camera is in third person
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
ENT.LegHealth = 30
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
     elseif zombieskin == 2 then
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
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    if (dmginfo:IsBulletDamage()) && hitgroup == HITGROUP_CHEST or hitgroup == HITGROUP_RIGHTARM or hitgroup == HITGROUP_LEFTARM or hitgroup == HITGROUP_RIGHTLEG or hitgroup == HITGROUP_LEFTLEG then
	    dmginfo:ScaleDamage(0.25)
end
    if GetConVarNumber("VJ_RECB_Knocked") == 0 then return end
    if self.CanBeKnocked == true && math.random(1,20) == 1 && CurTime() > self.NextKnockTimeT && !self.Crippled then
       self:VJ_ACT_PLAYACTIVITY("knocked_to_floor",true,100,false)
       self.MovementType = VJ_MOVETYPE_STATIONARY
	   self.CanTurnWhileStationary = false
	   self.HasPoseParameterLooking = false
	   self.CallForHelp = false
       self.HasBeenKnocked = true
       self.CanBeKnocked = false
       self:AddFlags(FL_NOTARGET)
       self.HasIdleSounds = false
       self.CanFlinch = 0
       self:SetCollisionBounds(Vector(13,13,25),Vector(-13,-13,0))

    timer.Simple(GetConVarNumber("VJ_RECB_Zombie_GetUp_Time"),function()
    if IsValid(self) && !self.Crippled && self.DeathAnimationCodeRan == false && self.Dead == false then
       self:VJ_ACT_PLAYACTIVITY("getup",true,false,false)
	   self.MovementType = VJ_MOVETYPE_GROUND
	   self.HasPoseParameterLooking = true
	   self.CallForHelp = true
       self.HasBeenKnocked = false
       self:RemoveFlags(FL_NOTARGET)
       self.HasIdleSounds = true
       self:SetCollisionBounds(Vector(13,13,72),Vector(-13,-13,0))
       self.NextKnockTimeT = CurTime() + math.random(5,8) 

 elseif IsValid(self) && self.Crippled == true && self.DeathAnimationCodeRan == false && self.Dead == false then
       self:VJ_ACT_PLAYACTIVITY("crawl_attack",true,1,false)
	   self.MovementType = VJ_MOVETYPE_GROUND
	   self.HasPoseParameterLooking = true
	   self.CallForHelp = true
       self.HasBeenKnocked = false
       self:RemoveFlags(FL_NOTARGET)
       self.HasIdleSounds = true
       self:SetCollisionBounds(Vector(16,16,20),Vector(-16,-16,0))
end
               timer.Simple(3,function()
               if IsValid(self) && !self.Crippled then
                 self.CanBeKnocked = true
                 self.CanFlinch = 1

           elseif IsValid(self) && self.Crippled == true then
                 self.CanFlinch = 0
              end
          end)
      end)
   end
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
     if GetConVarNumber("VJ_RECB_Dismember") == 0 then return end	
		if self.Head_Damaged == false && math.random(1,10) == 1 && hitgroup == HITGROUP_HEAD then
		self.Head_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())	
		self:EmitSound(Sound("vj_recb/zombie/zom_neck_break.wav",75,100))
        self:SetBodygroup(0,0)		
		self:SetBodygroup(1,2)
		self:SetBodygroup(7,0)
	
		elseif self.Chest_Damaged == false && math.random(1,10) == 1 && hitgroup == HITGROUP_CHEST then
		self.Chest_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("chest")).Pos,self:GetAngles())
		self:EmitSound(Sound("vj_recb/zombie/zom_armlost.wav",75,100))
		self:SetBodygroup(0,0)
		self:SetBodygroup(4,1)
	
		elseif self.RArm_Damaged == false && math.random(1,10) == 1 && hitgroup == HITGROUP_RIGHTARM then
		self.RArm_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("rarm")).Pos,self:GetAngles())
		self:EmitSound(Sound("vj_recb/zombie/zom_armlost.wav",75,100))
		self:SetBodygroup(0,0)
		self:SetBodygroup(5,1)

		elseif self.LArm_Damaged == false && math.random(1,10) == 1 && hitgroup == HITGROUP_LEFTARM then
		self.LArm_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("larm")).Pos,self:GetAngles())
		self:EmitSound(Sound("vj_recb/zombie/zom_armlost.wav",75,100))
		self:SetBodygroup(0,0)
		self:SetBodygroup(6,1)
    end
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_OnBleed(dmginfo,hitgroup)
    if GetConVarNumber("VJ_RECB_Dismember") == 0 then return end
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
				self:EmitSound(Sound("vj_recb/zombie/zom_leglost.wav",75,100))
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
    self.SoundTbl_MeleeAttack = {"vj_recb/zombie/bite1.wav","vj_recb/zombie/bite2.wav"}
	self.HasMeleeAttackMissSounds = false 
	self.AnimTbl_IdleStand = {ACT_IDLE_STIMULATED}
	self.AnimTbl_Walk = {ACT_WALK_STIMULATED}
	self.AnimTbl_Run = {ACT_WALK_STIMULATED}
	self.MeleeAttackDamage = self.MeleeAttackDamage /2
	self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2}
	self.CanFlinch = 0
	self.HasRangeAttack = false
	self.HasMeleeAttack = true 
	self.MeleeAttackDistance = 20 
    self.MeleeAttackDamageDistance = 50
	self.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(30, 25, -15), 
	FirstP_Bone = "ValveBiped.Bip01_Head1", 
	FirstP_Offset = Vector(10, 0, -30), 
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    if GetConVarNumber("VJ_RECB_Dismember") == 0 then return end
	if hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 then
	    self:EmitSound(Sound("vj_recb/zombie/zom_headburst.wav",75,100))
		self:SetBodygroup(0,0)
		self:SetBodygroup(1,3)
		self:SetBodygroup(7,0)
        self.HasDeathSounds = false		
	
		if self.HasGibDeathParticles == true then
			for i=1,3 do
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
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/