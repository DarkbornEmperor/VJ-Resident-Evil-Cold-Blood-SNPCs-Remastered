AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/recb/recb_prototyrant.mdl"} 
ENT.StartHealth = 5000
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","FACTION_MOLDED","FACTION_RE6_USTANAK","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.TimeUntilMeleeAttackDamage = false
ENT.FootStepTimeRun = 0.27
ENT.FootStepTimeWalk = 0.6
ENT.NextMeleeAttackTime = 1.5
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.AnimTbl_Death = {ACT_DIEVIOLENT}
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"tyrant/tyrant_foot.wav"}
ENT.SoundTbl_Alert = {"tyrant/tyrant_roar.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"tyrant/tyrant_swing2.wav","tyrant/tyrant_swing.wav"}
ENT.SoundTbl_MeleeAttack = {"tyrant/tyrant_stab.wav","tyrant/tyrant_slash.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100

-- Custom
ENT.Tyrant_Mutate = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
end
	if key == "death" then
		VJ_EmitSound(self, "tyrant/tyrant_bodyhit.wav", 85, math.random(100,100))
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize() 
	self:SetCollisionBounds(Vector(20, 20, 100), Vector(-20, -20, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------	
function ENT:MultipleMeleeAttacks()
	local randattack = math.random(1,2)
	if randattack == 1 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack1"}
		self.MeleeAttackDamage = 35
		self.MeleeAttackDistance = 40
		self.MeleeAttackDamageDistance = 90
		
	elseif randattack == 2 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack2"}
		self.MeleeAttackDamage = 35
		self.MeleeAttackDistance = 40
		self.MeleeAttackDamageDistance = 90

	end
end
---------------------------------------------------------------------------------------------------------------------------------------------    
--function ENT:CustomOnThink_AIEnabled()
	--if self.Tyrant_Mutate == false && self.Dead == false && (self.StartHealth -1000 > self:Health()) then
		--self.Tyrant_Mutate = true
		--self:VJ_ACT_PLAYACTIVITY("attack2",true,1,false)
		--timer.Simple(0.3,function() if IsValid(self) then
			--if self.HasSounds == true then VJ_EmitSound(self,"tyrant/tyrant_roar.wav") end end end)
			--timer.Simple(1,function() if IsValid(self) then 
				-- self.AnimTbl_Run = {ACT_RUN}
               
			--end
		--end)
	--end
--end	 
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/