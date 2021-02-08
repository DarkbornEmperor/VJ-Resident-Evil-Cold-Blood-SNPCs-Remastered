AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/recb/recb_crow.mdl"} 
ENT.StartHealth = 50
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.MovementType = VJ_MOVETYPE_AERIAL
ENT.Aerial_AnimTbl_Calm = {ACT_WALK} 
ENT.Aerial_AnimTbl_Alerted = {ACT_WALK}
ENT.BloodColor = "Red"
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = 1
ENT.FlinchChance = 5
ENT.AnimTbl_Flinch = {ACT_FLINCH_SMALL,ACT_FLINCH_BIG}
ENT.HasMeleeAttack = true 
ENT.NextMeleeAttackTime = 1.5
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 80
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 
ENT.GibOnDeathDamagesTable = {"All"}

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play}
ENT.SoundTbl_Breath = {"crow/crow_flap.wav"}
ENT.SoundTbl_Idle = {"crow/crow_caw.wav"}
ENT.SoundTbl_Alert = {"crow/crow_caw.wav"}
ENT.SoundTbl_Death = {"crow/crow_die.wav"}
ENT.SoundTbl_MeleeAttack = {"crow/crow_peck.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"crow/crow_attack.wav"} 

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.BreathSoundLevel = 40
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
	self:SetCollisionBounds(Vector(6.06, 13.58, 11.63), Vector(-9.57, -13.59, -5.53))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
    local shark_attack = math.random(1,1)

	if licker_attack == 1 then
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