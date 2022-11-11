AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/hunter_2.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 250
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH}
ENT.HasMeleeAttack = true 
ENT.NextMeleeAttackTime = 1.5
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 15
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.HasLeapAttack = true 
ENT.LeapAttackDamage = 15
ENT.LeapAttackDamageDistance = 90
ENT.TimeUntilLeapAttackDamage = false
ENT.NextAnyAttackTime_Leap = 1.5
ENT.NextLeapAttackTime = 8
ENT.AnimTbl_LeapAttack = {ACT_SPECIAL_ATTACK1}
ENT.LeapAttackVelocityForward = 100 
ENT.LeapAttackVelocityUp = 250
ENT.LeapDistance = 300
ENT.LeapToMeleeDistance = 200
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DisableFootStepSoundTimer = true 
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -35), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Object_3", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_recb/hunter2/hu_run.wav","vj_recb/hunter2/hu_walk.wav"} 
ENT.SoundTbl_Idle = {"vj_recb/hunter2/hunter.wav"}
ENT.SoundTbl_Alert = {"vj_recb/hunter2/hunter.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"vj_recb/hunter2/hu_slash.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_recb/hunter2/hu_miss.wav"}
ENT.SoundTbl_LeapAttackJump = {"vj_recb/hunter2/hu_jump.wav"}
ENT.SoundTbl_LeapAttackDamage = {"vj_recb/hunter2/hu_slash.wav"}
ENT.SoundTbl_LeapAttackDamageMiss = {"vj_recb/hunter2/hu_miss.wav"}
ENT.SoundTbl_Pain = {"vj_recb/hunter2/hu_pain.wav"}
ENT.SoundTbl_Death = {"vj_recb/hunter2/hu_die.wav"}
ENT.SoundTbl_Impact = {"vj_recb/shared/hit_flesh1.wav","vj_recb/shared/hit_flesh2.wav","vj_recb/shared/hit_flesh3.wav","vj_recb/shared/hit_flesh4.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100

-- Custom
ENT.Hunter_Skin = 0
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
		VJ_EmitSound(self, "vj_recb/hunter2/hu_bodyfall.wav", 75, 100)
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize() 
	self:SetCollisionBounds(Vector(16, 16, 60), Vector(-16, -16, 0))
    self:SetModelScale(1.1,0.1)	
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/