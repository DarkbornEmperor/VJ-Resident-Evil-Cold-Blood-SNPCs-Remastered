AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/recb/recb_tyrant_103.mdl"} 
ENT.StartHealth = 1000
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.BloodColor = "Red"
ENT.NextMeleeAttackTime = 1.5
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 10
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"tyrant103/ty_walk.wav"}
--ENT.SoundTbl_BeforeMeleeAttack = {"tyrant103/ty_swing.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"tyrant103/ty_swing.wav"}
ENT.SoundTbl_MeleeAttack = {"tyrant103/ty_punch.wav"}

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
function ENT:MultipleMeleeAttacks()
	local randattack = math.random(1,3)
	if randattack == 1 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack1"}
		self.MeleeAttackDamage = 25
		self.MeleeAttackDistance = 40
		self.MeleeAttackDamageDistance = 80
		
	elseif randattack == 2 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack2"}
		self.MeleeAttackDamage = 25
		self.MeleeAttackDistance = 40
		self.MeleeAttackDamageDistance = 80
		
	elseif randattack == 3 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack3"}
		self.MeleeAttackDamage = 25
		self.MeleeAttackDistance = 40
		self.MeleeAttackDamageDistance = 80
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize() 
	self:SetCollisionBounds(Vector(14, 22, 87), Vector(-10, -21, 0))	
end   	 
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/