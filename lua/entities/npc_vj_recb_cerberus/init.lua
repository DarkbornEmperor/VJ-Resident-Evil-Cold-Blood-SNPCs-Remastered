AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/cerberus.mdl"} 
ENT.StartHealth = 60
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_MEDIUM
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_FLINCH_PHYSICS}
ENT.HasMeleeAttack = true 
ENT.NextMeleeAttackTime = 1.5
ENT.TimeUntilMeleeAttackDamage = false
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DisableFootStepSoundTimer = true
ENT.GibOnDeathDamagesTable = {"All"}
ENT.MeleeAttackDistance = 25 
ENT.MeleeAttackDamageDistance = 60
ENT.NextMeleeAttackTime = 1.5
ENT.HasLeapAttack = true 
ENT.AnimTbl_LeapAttack = {ACT_SPECIAL_ATTACK1}
ENT.NextLeapAttackTime = 8
ENT.LeapAttackDamageDistance = 50
ENT.LeapAttackDamage = 15
ENT.TimeUntilLeapAttackDamage = 0.4 
ENT.LeapAttackExtraTimers = {0.6, 0.8, 1} 
ENT.StopLeapAttackAfterFirstHit = true
ENT.LeapAttackVelocityForward = 100 
ENT.LeapAttackVelocityUp = 100
ENT.LeapDistance = 200
ENT.LeapToMeleeDistance = 150
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -30), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bone08", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_recb/cerberus/cer_run.wav","vj_recb/cerberus/cer_run2.wav"}
ENT.SoundTbl_Idle = {"vj_recb/cerberus/cer_growl.wav"}
ENT.SoundTbl_CombatIdle = {"vj_recb/cerberus/cer_bark.wav","vj_recb/cerberus/cer_growl.wav"} 
ENT.SoundTbl_BeforeMeleeAttack = {"vj_recb/cerberus/cer_bite.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"vj_recb/cerberus/Bite.wav"}
ENT.SoundTbl_LeapAttackJump = {"vj_recb/cerberus/cer_jump.wav"}
ENT.SoundTbl_LeapAttackDamage = {"vj_recb/cerberus/Bite.wav"}
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
		//self:LeapDamageCode()
end
	if key == "death" then
		VJ_EmitSound(self, "vj_recb/cerberus/cer_bodyfall.wav", 75, 100)
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(15, 15, 40), Vector(-15, -15, 0))
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
if math.random(1,2) == 1 then
        self:VJ_ACT_PLAYACTIVITY("vjseq_bark",true,false,true)
		self.SoundTbl_Alert = {"vj_recb/cerberus/cer_alert.wav"}
else
        self:VJ_ACT_PLAYACTIVITY("vjseq_growl",true,false,true)
		self.SoundTbl_Alert = {"vj_recb/cerberus/cer_growl.wav"}		
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnCallForHelp(ally)
        self:VJ_ACT_PLAYACTIVITY("vjseq_growl",true,false,true)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
if GetConVar("VJ_RECB_CerberusSleep"):GetInt() == 0 or self.DeathAnimationCodeRan then return end
	if !self.VJ_IsBeingControlled && self.Cerberus_IdleState != "N" && (self:IsMoving() or CurTime() > self.Cerberus_NextGetUpT) then 
		self:VJ_ACT_PLAYACTIVITY("sleeptostand",true,false)
		self.Cerberus_IdleState = "N"
		self.DisableWandering = false
		self.DisableChasingEnemy = false
		self.Cerberus_NextSleepT = CurTime() + 10
end
	
		if !self.VJ_IsBeingControlled && IsValid(self:GetEnemy()) then 
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
			if !self.VJ_IsBeingControlled && self.Cerberus_IdleState == "N" && !self:IsMoving() && CurTime() > self.Cerberus_NextGetUpT && math.random(1,150) == 1 then 
				self:VJ_ACT_PLAYACTIVITY("gotosleep",true,false)
				self.Cerberus_IdleState = "S"
				self.DisableWandering = true
				self.DisableChasingEnemy = true
				self.Cerberus_NextGetUpT = CurTime() + 20 //math.Rand(10,35)
end
			
			if !self.VJ_IsBeingControlled && self.Cerberus_IdleState == "N" then
				self.AnimTbl_IdleStand = {ACT_IDLE}
			elseif  self.Cerberus_IdleState == "S" then
				self.AnimTbl_IdleStand = {"sleep"}
	end	  
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    if GetConVar("VJ_RECB_Gib"):GetInt() == 0 then return end
	if dmginfo:GetDamageForce():Length() < 800 then return end
	if hitgroup == HITGROUP_HEAD then
	    VJ_EmitSound(self,"vj_recb/zombie/zom_headburst.wav",75,100)
		self:SetBodygroup(0,1)
	
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
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/