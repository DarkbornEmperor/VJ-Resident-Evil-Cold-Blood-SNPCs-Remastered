AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/zombie_hunk.mdl"} 
ENT.StartHealth = 200
ENT.MeleeAttackDamage = 15
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.NextMeleeAttackTime = 1.5
ENT.SlowPlayerOnMeleeAttack = false
ENT.HasMeleeAttackKnockBack = false
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_MeleeAttackExtra = {"vj_recb/zombie/CrimsonHead/crimhead_slash.wav","vj_recb/zombie/CrimsonHead/crimhead_slash.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_recb/shared/claw_miss1.wav","vj_recb/shared/claw_miss2.wav"}
-- Custom
ENT.LegHealth = 0
ENT.Crippled = false
ENT.Vomit_Zombie = false
ENT.HasBeenKnocked = false
ENT.CanBeKnocked = false	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoices()
   self.SoundTbl_Idle = {"vj_recb/zombie/merc/zom_idle.wav"}
   self.SoundTbl_Alert = {"vj_recb/zombie/merc/zom_idle.wav"}
   self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/merc/zom_attack.wav"}
   self.SoundTbl_Pain = {"vj_recb/zombie/merc/zom_pain.wav"}
   self.SoundTbl_Death = {"vj_recb/zombie/merc/zom_die.wav"}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetVomitZombie() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed) 
    self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_Miss() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    if (dmginfo:IsBulletDamage()) && hitgroup == HITGROUP_CHEST or hitgroup == HITGROUP_HEAD then
	    dmginfo:ScaleDamage(0.25)
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup) end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_OnBleed(dmginfo,hitgroup) end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Cripple() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup) end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
	 if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
	else
		self.AnimTbl_Death = {ACT_DIEFORWARD,ACT_DIESIMPLE}
    end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/