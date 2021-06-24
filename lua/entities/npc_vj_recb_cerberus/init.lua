AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/recb_cerberus.mdl"} 
ENT.StartHealth = 60
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_MEDIUM
ENT.CanFlinch = 1
ENT.FlinchChance = 5
ENT.AnimTbl_Flinch = {ACT_FLINCH_PHYSICS}
ENT.HasMeleeAttack = true 
ENT.NextMeleeAttackTime = 1.5
ENT.TimeUntilMeleeAttackDamage = false
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true
ENT.GibOnDeathDamagesTable = {"All"}
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.NextMeleeAttackTime = 1.5
ENT.NextAnyAttackTime_Melee = 0.8
ENT.HasLeapAttack = true 
ENT.LeapAttackDamage = 15
ENT.TimeUntilLeapAttackDamage = false
ENT.AnimTbl_LeapAttack = {"vjseq_jump_window"}
ENT.LeapAttackVelocityForward = 100 
ENT.LeapAttackVelocityUp = 100
ENT.LeapDistance = 200
ENT.LeapToMeleeDistance = 100
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -30), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_recb/cerberus/cer_run.wav","vj_recb/cerberus/cer_run2.wav"}
ENT.SoundTbl_Idle = {"vj_recb/cerberus/cer_growl.wav"}
ENT.SoundTbl_CombatIdle = {"vj_recb/cerberus/cer_bark.wav","vj_recb/cerberus/cer_growl.wav"} 
ENT.SoundTbl_BeforeMeleeAttack = {"vj_recb/cerberus/cer_bite.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_recb/cerberus/Bite.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_recb/shared/claw_miss1.wav","vj_recb/shared/claw_miss2.wav"}
ENT.SoundTbl_LeapAttackJump = {"vj_recb/cerberus/cer_jump.wav"}
ENT.SoundTbl_LeapAttackDamage = {"vj_recb/cerberus/Bite.wav"}
ENT.SoundTbl_LeapAttackDamageMiss = {"vj_recb/shared/claw_miss1.wav","vj_recb/shared/claw_miss2.wav"}
ENT.SoundTbl_CallForHelp = {"vj_recb/cerberus/cer_howl.wav"}
ENT.SoundTbl_Pain = {"vj_recb/cerberus/cer_pain.wav","vj_recb/cerberus/cer_pain2.wav"}
ENT.SoundTbl_Death = {"vj_recb/cerberus/cer_die.wav"}
ENT.SoundTbl_Impact = {"vj_recb/shared/hit_flesh1.wav","vj_recb/shared/hit_flesh2.wav","vj_recb/shared/hit_flesh3.wav","vj_recb/shared/hit_flesh4.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100

-- Sleeping
ENT.Cerberus_IdleState = "N" 
ENT.Cerberus_InTransition = false
ENT.Cerberus_NextGetUpT = 0
ENT.Cerberus_NextSleepT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
		self:LeapDamageCode()
end
	if key == "death" then
		VJ_EmitSound(self, "vj_recb/cerberus/cer_bodyfall.wav", 85, 100)
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
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(45, 8, 38), Vector(-10, -8, 0))
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
if math.random(1,2) == 1 then
        self:VJ_ACT_PLAYACTIVITY("vjseq_bark",true,1.5,true)
		self.SoundTbl_Alert = {"vj_recb/cerberus/cer_alert.wav"}
else
        self:VJ_ACT_PLAYACTIVITY("vjseq_growl",true,1.5,true)
		self.SoundTbl_Alert = {"vj_recb/cerberus/cer_growl.wav"}		
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnCallForHelp(ally)
if math.random(1,2) == 1 then
        self:VJ_ACT_PLAYACTIVITY("vjseq_growl",true,2,true)	
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if GetConVarNumber("VJ_RECB_Cerberus_Sleep") == 1 && self.VJ_IsBeingControlled == false && self.Cerberus_IdleState != "N" && (self:IsMoving() or CurTime() > self.Cerberus_NextGetUpT) && self.DeathAnimationCodeRan == false && self.Dead == false then 
		self:VJ_ACT_PLAYACTIVITY("sleeptostand",true,false)
		self.Cerberus_IdleState = "N"
		self.DisableWandering = false
		self.DisableChasingEnemy = false
		self.Cerberus_NextSleepT = CurTime() + 10
end
	
		if GetConVarNumber("VJ_RECB_Cerberus_Sleep") == 1 && self.VJ_IsBeingControlled == false && IsValid(self:GetEnemy()) && self.DeathAnimationCodeRan == false && self.Dead == false then 
			if self.Cerberus_IdleState != "N" && self.Cerberus_InTransition == false then
				self.Cerberus_InTransition = true
				self:VJ_ACT_PLAYACTIVITY("sleeptostand",true,false,false,0,{},function(vsched)
					vsched.RunCode_OnFinish = function()
						self.Cerberus_InTransition = false
						self.Cerberus_IdleState = "N"
	end
end)
				self.DisableWandering = false
				self.DisableChasingEnemy = false
	end
end
			if GetConVarNumber("VJ_RECB_Cerberus_Sleep") == 1 && self.VJ_IsBeingControlled == false && self.Cerberus_IdleState == "N" && !self:IsMoving() && CurTime() > self.Cerberus_NextGetUpT && math.random(1,150) == 1 && self.DeathAnimationCodeRan == false && self.Dead == false then 
				self:VJ_ACT_PLAYACTIVITY("gotosleep",true,false)
				self.Cerberus_IdleState = "S"
				self.DisableWandering = true
				self.DisableChasingEnemy = true
				self.Cerberus_NextGetUpT = CurTime() + 20 //math.Rand(10,35)
end
			
			if GetConVarNumber("VJ_RECB_Cerberus_Sleep") == 1 && self.VJ_IsBeingControlled == false && self.Cerberus_IdleState == "N" && self.DeathAnimationCodeRan == false && self.Dead == false then
				self.AnimTbl_IdleStand = {ACT_IDLE}
			elseif  self.Cerberus_IdleState == "S" then
				self.AnimTbl_IdleStand = {"sleep"}
	end	  
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 then
	    self:EmitSound(Sound("vj_recb/zombie/zom_headburst.wav",70))
		self:SetBodygroup(0,1)
	
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
	 if self.DeathAnimationCodeRan == true && self.Dead == true then
	    self.Cerberus_IdleState = false
        self.Cerberus_InTransition = false
	    self.Cerberus_NextGetUpT = false
        self.Cerberus_NextSleepT = false
    end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/