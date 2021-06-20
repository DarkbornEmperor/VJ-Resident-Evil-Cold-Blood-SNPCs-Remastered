AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/recb/recb_cerberus.mdl"} 
ENT.StartHealth = 80
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.CanFlinch = 1
ENT.FlinchChance = 5
ENT.AnimTbl_Flinch = {ACT_FLINCH_PHYSICS}
ENT.NextMeleeAttackTime = 1.5
ENT.TimeUntilMeleeAttackDamage = false
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true
ENT.GibOnDeathDamagesTable = {"All"}
ENT.MeleeAttackDistance = 20 
ENT.MeleeAttackDamageDistance = 60
ENT.NextAnyAttackTime_Melee = 0.8
ENT.HasLeapAttack = true 
ENT.LeapAttackDamage = 15
ENT.TimeUntilLeapAttackDamage = 0.4
ENT.AnimTbl_LeapAttack = {"vjseq_jump_window"}
ENT.LeapAttackVelocityForward = 100 
ENT.LeapAttackVelocityUp = 100
ENT.LeapDistance = 100
ENT.LeapToMeleeDistance = 50

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"cerberus/cer_run.wav","cerberus/cer_run2.wav"}
ENT.SoundTbl_Idle = {"cerberus/cer_growl.wav"} 
ENT.SoundTbl_CombatIdle = {"cerberus/cer_bark.wav","cerberus/cer_growl.wav"} 
ENT.SoundTbl_Alert = {"cerberus/cer_alert.wav"}
ENT.SoundTbl_CallForHelp = {"cerberus/cer_howl.wav"}
ENT.SoundTbl_Pain = {"cerberus/cer_pain.wav","cerberus/cer_pain2.wav"}
ENT.SoundTbl_Death = {"cerberus/cer_die.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"cerberus/cer_bite.wav"}
ENT.SoundTbl_MeleeAttack = {"cerberus/Bite.wav"}
ENT.SoundTbl_LeapAttackJump = {"cerberus/cer_jump.wav"}
ENT.SoundTbl_LeapAttackDamage = {"cerberus/Bite.wav"}

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
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(40.46, 8.60, 38.69), Vector(-10.48, -9.03, -1.23))
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
if math.random(1,2) == 1 then
        self:VJ_ACT_PLAYACTIVITY("vjseq_bark",true,2,true)	
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self.Cerberus_IdleState != "N" && (self:IsMoving() or CurTime() > self.Cerberus_NextGetUpT) then 
		self:VJ_ACT_PLAYACTIVITY("sleeptostand",true,false)
		self.Cerberus_IdleState = "N"
		self.DisableWandering = false
		self.DisableChasingEnemy = false
		self.Cerberus_NextSleepT = CurTime() + 10
end
	
		if IsValid(self:GetEnemy()) then 
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
			if self.Cerberus_IdleState == "N" && !self:IsMoving() && CurTime() > self.Cerberus_NextGetUpT && math.random(1,150) == 1 then 
				self:VJ_ACT_PLAYACTIVITY("gotosleep",true,false)
				self.Cerberus_IdleState = "S"
				self.DisableWandering = true
				self.DisableChasingEnemy = true
				self.Cerberus_NextGetUpT = CurTime() + 20 //math.Rand(10,35)
end
			
			if self.Cerberus_IdleState == "N" then
				self.AnimTbl_IdleStand = {ACT_IDLE}
			elseif  self.Cerberus_IdleState == "S" then
				self.AnimTbl_IdleStand = {"sleep"}
	end	  
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 then
	    self:EmitSound(Sound("zombie/zom_headburst.wav",70))
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
function ENT:CustomOnKilled(dmginfo, hitgroup) 
	 if self.DeathAnimationCodeRan == true then
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