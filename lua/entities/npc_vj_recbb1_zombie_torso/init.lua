AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/recb_zombie_torso_beta.mdl"} 
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:ZombieVoices()	
    self:SetCollisionBounds(Vector(16,16,20),Vector(-16,-16,0))
	self:SetSkin(math.random(0,5))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_Miss() 
    if self.MeleeAttacking == true then
	   self.vACT_StopAttacks = true
	   self.PlayingAttackAnimation = false
       self:VJ_ACT_PLAYACTIVITY("flinch",true,0.5,false)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/