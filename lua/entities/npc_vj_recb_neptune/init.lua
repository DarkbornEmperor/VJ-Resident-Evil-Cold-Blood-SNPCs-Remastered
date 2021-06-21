AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/recb/recb_neptune.mdl"} 
ENT.StartHealth = 400
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.MovementType = VJ_MOVETYPE_AQUATIC 
ENT.Aquatic_SwimmingSpeed_Calm = 80 
ENT.Aquatic_SwimmingSpeed_Alerted = 200
ENT.Aquatic_AnimTbl_Calm = {ACT_WALK} 
ENT.Aquatic_AnimTbl_Alerted = {ACT_RUN}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_LARGE
ENT.CanFlinch = 1
ENT.FlinchChance = 5
ENT.AnimTbl_Flinch = {ACT_FLINCH_SMALL,ACT_FLINCH_BIG}
ENT.HasMeleeAttack = true 
ENT.NextMeleeAttackTime = 1.5
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 80 
ENT.MeleeAttackDamageDistance = 170
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 
ENT.GibOnDeathDamagesTable = {"All"}

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play}
ENT.SoundTbl_Breath = {"shark/shark_swim_peace.wav"}
ENT.SoundTbl_Alert = {"shark/Shark_Alert.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"shark/Shark_attack.wav"} 
ENT.SoundTbl_MeleeAttack = {"shark/shark_bite.wav"} 
ENT.SoundTbl_Pain = {"shark/Shark_pain.wav"}
ENT.SoundTbl_Death = {"shark/Shark_death.wav"}
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
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize() 
	self:SetCollisionBounds(Vector(123.34, 50, 50), Vector(-150, -50, -30))	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
    local shark_attack = math.random(1,1)

	if shark_attack == 1 then
		self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
		self.MeleeAttackDamage = 15
   end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
		self.AnimTbl_Death = {ACT_DIESIMPLE,ACT_DIEVIOLENT}
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/