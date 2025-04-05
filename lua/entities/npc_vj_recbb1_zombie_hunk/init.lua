include("entities/npc_vj_recb_zombie_male/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b1/zombie_hunk.mdl"
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackPlayerSpeed = false
ENT.HasMeleeAttackKnockBack = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoices()
    self.SoundTbl_Idle =
    "vj_recb/zombie/b1/male/merc/zom_idle.wav"

    self.SoundTbl_Alert =
    "vj_recb/zombie/b1/male/merc/zom_idle.wav"

    self.SoundTbl_BeforeMeleeAttack =
    "vj_recb/zombie/b1/male/merc/zom_attack.wav"

    self.SoundTbl_Pain =
    "vj_recb/zombie/b1/male/merc/zom_pain.wav"

    self.SoundTbl_Death =
    "vj_recb/zombie/b1/male/merc/zom_die.wav"
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Init()
    self.SoundTbl_FootStep = {
    "vj_recb/zombie/b1/footstep1.wav",
    "vj_recb/zombie/b1/footstep2.wav",
    "vj_recb/zombie/b1/footstep3.wav",
    "vj_recb/zombie/b1/footstep4.wav"
}
    self.SoundTbl_MeleeAttackExtra = {
    "vj_recb/zombie/crimsonhead/crimhead_slash.wav",
    "vj_recb/zombie/crimsonhead/crimhead_slash.wav"
}
    self.SoundTbl_MeleeAttackMiss = {
    "vj_recb/shared/claw_miss1.wav",
    "vj_recb/shared/claw_miss2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttack(status,enemy)
    if status == "Init" then
        self.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status,ent,isProp) return end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status) return end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
    if status == "DeathAnim" then
    if hitgroup == HITGROUP_HEAD && !self.Crippled then
        self.AnimTbl_Death = {ACT_DIE_HEADSHOT,ACT_DIE_GUTSHOT}
     else
        self.AnimTbl_Death = {ACT_DIESIMPLE,ACT_DIEFORWARD,ACT_DIE_GUTSHOT}
        end
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/