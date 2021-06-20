AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/recb/recb_licker.mdl"} 
ENT.StartHealth = 200
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = 1
ENT.FlinchChance = 5
ENT.AnimTbl_Flinch = {ACT_FLINCH_PHYSICS}
ENT.HasMeleeAttack = true 
ENT.NextMeleeAttackTime = 1.5
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 35 
ENT.MeleeAttackDamageDistance = 80
ENT.HasLeapAttack = true 
ENT.LeapAttackDamage = 15
ENT.TimeUntilLeapAttackDamage = 0.4
ENT.NextAnyAttackTime_Leap = 1.5
ENT.NextLeapAttackTime = 8
ENT.LeapAttackAnimationDecreaseLengthAmount = 1.8
ENT.AnimTbl_LeapAttack = {"vjseq_jump"}
ENT.LeapAttackVelocityForward = 100 
ENT.LeapAttackVelocityUp = 200
ENT.LeapDistance = 200
ENT.LeapToMeleeDistance = 100
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 
ENT.GibOnDeathDamagesTable = {"All"}

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"licker/li_walk.wav"}
ENT.SoundTbl_Idle = {"licker/li_idle.wav"}
ENT.SoundTbl_Alert = {"licker/li_idle.wav"}
--ENT.SoundTbl_MeleeAttackMiss = {"licker/li_slash.wav"}
ENT.SoundTbl_Pain = {"licker/li_pain.wav"}
ENT.SoundTbl_Death = {"licker/li_die.wav"}
ENT.SoundTbl_LeapAttackJump = {"licker/li_jump.wav"}
ENT.SoundTbl_LeapAttackDamage = {"licker/li_slash.wav"}
--ENT.SoundTbl_LeapAttackMiss = {"licker/li_slash.wav"}
ENT.SoundTbl_Impact = {"shared/hit_flesh1.wav","shared/hit_flesh2.wav","shared/hit_flesh3.wav","shared/hit_flesh4.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
end
	if key == "tongue_attack" then
		self:MeleeAttackCode()
end	
	if key == "death" then
		VJ_EmitSound(self, "licker/li_bodyfall.wav", 85, math.random(100,100))
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize() 
	self:SetCollisionBounds(Vector(30, 20, 32), Vector(-30, -20, 0))	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
    local licker_attack = math.random(1,2)

	if licker_attack == 1 then
		self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
		self.MeleeAttackDamage = 15
		self.SoundTbl_MeleeAttack = {"licker/li_slash.wav"}
end
	if licker_attack == 2 then
		self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2}
		self.MeleeAttackDamage = 25
		self.SoundTbl_MeleeAttack = {"licker/li_tongue.wav"}
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
	if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
	else
		self.AnimTbl_Death = {ACT_DIESIMPLE}
end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/