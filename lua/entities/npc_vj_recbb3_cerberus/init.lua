AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/dog.mdl"} 
ENT.StartHealth = 60
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_MEDIUM
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH}
ENT.HasMeleeAttack = false 
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true
ENT.GibOnDeathDamagesTable = {"All"}
ENT.MeleeAttackDistance = 25 
ENT.MeleeAttackDamageDistance = 50
ENT.NextMeleeAttackTime = 1.5
ENT.HasLeapAttack = true 
ENT.AnimTbl_LeapAttack = {ACT_SPECIAL_ATTACK1}
ENT.NextLeapAttackTime = 4
ENT.LeapAttackDamageDistance = 50
ENT.LeapAttackDamage = 15
ENT.TimeUntilLeapAttackDamage = false 
//ENT.LeapAttackExtraTimers = {0.6, 0.8, 1} 
ENT.StopLeapAttackAfterFirstHit = true
ENT.LeapAttackVelocityForward = 100 
ENT.LeapAttackVelocityUp = 100
ENT.LeapDistance = 200
ENT.LeapToMeleeDistance = 1
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -30), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Object_3", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_recb/dog2/dog_step.wav"}
ENT.SoundTbl_Idle = {"vj_recb/dog2/dog_growl.wav"}
ENT.SoundTbl_CombatIdle = {"vj_recb/dog2/dog_bark.wav","vj_recb/dog2/dog_growl.wav"} 
ENT.SoundTbl_LeapAttackJump = {"vj_recb/dog2/dog_attack.wav"}
ENT.SoundTbl_LeapAttackDamage = {"vj_recb/dog2/dog_eat.wav"}
ENT.SoundTbl_CallForHelp = {"vj_recb/dog2/dog_howl.wav"}
ENT.SoundTbl_Pain = {"vj_recb/dog2/dog_pain.wav"}
ENT.SoundTbl_Death = {"vj_recb/dog2/dog_die.wav"}
ENT.SoundTbl_Impact = {"vj_recb/shared/hit_flesh1.wav","vj_recb/shared/hit_flesh2.wav","vj_recb/shared/hit_flesh3.wav","vj_recb/shared/hit_flesh4.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:LeapDamageCode()
end
	if key == "death" then
		VJ_EmitSound(self, "vj_recb/dog2/dog_bodyfall.wav", 75, 100)
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(15, 15, 40), Vector(-15, -15, 0))
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
if math.random(1,2) == 1 then
        self:VJ_ACT_PLAYACTIVITY("vjseq_bark",true,0.5,true)
		self.SoundTbl_Alert = {"vj_recb/dog2/dog_bark.wav"}
else
        self:VJ_ACT_PLAYACTIVITY("vjseq_growl",true,false,true)
		self.SoundTbl_Alert = {"vj_recb/dog2/dog_growl.wav"}		
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnCallForHelp(ally)
        self:VJ_ACT_PLAYACTIVITY("vjseq_howl",true,fslse,true)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    if GetConVarNumber("VJ_RECB_Knocked") == 0 then return end
	if hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 then
	    self:EmitSound(Sound("vj_recb/zombie/zom_headburst.wav",75))
		self:SetBodygroup(1,1)
	
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
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/