AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/recb/recb_ant_boss.mdl"} 
ENT.StartHealth = 200
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Yellow"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact_green"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Yellow"}
ENT.HullType = HULL_LARGE
ENT.CanFlinch = 1
ENT.FlinchChance = 5
ENT.AnimTbl_Flinch = {ACT_FLINCH_PHYSICS}
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 10
ENT.MeleeAttackDistance = 25 
ENT.MeleeAttackDamageDistance = 70
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 
ENT.GibOnDeathDamagesTable = {"All"}

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"ant/ant_walk.wav"}
ENT.SoundTbl_Idle = {"ant/ant_idle.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"ant/ant_attack.wav"}
ENT.SoundTbl_MeleeAttack = {"ant/ant_bite.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"ant/ant_bitemiss.wav"}
ENT.SoundTbl_Pain = {"ant/ant_pain.wav"}
ENT.SoundTbl_Death = {"ant/ant_die.wav"}
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
	if key == "death" then
		VJ_EmitSound(self, "ant/ant_bodyfall.wav", 85, math.random(100,100))
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize() 
	self:SetCollisionBounds(Vector(40, 22, 40), Vector(-40, -22, 0))
	self:SetSkin(math.random(0,1))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
		self.AnimTbl_Death = {ACT_DIESIMPLE}
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/