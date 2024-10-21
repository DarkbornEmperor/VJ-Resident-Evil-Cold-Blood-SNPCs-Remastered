include("entities/npc_vj_recb_hunter/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b1/hunter.mdl"
ENT.TimeUntilLeapAttackDamage = 0.7
ENT.TimeUntilLeapAttackVelocity = 0.3
ENT.LeapAttackExtraTimers = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Hunter_Init()
    self.SoundTbl_FootStep = {
    "vj_recb/hunter/b3/hu_run.wav",
    "vj_recb/hunter/b3/hu_walk.wav"
}
    self.SoundTbl_MeleeAttackExtra = {
    "vj_recb/hunter/b3/hu_slash.wav"
}
    self.SoundTbl_MeleeAttackMiss = {
    "vj_recb/hunter/b3/hu_miss.wav"
}
    self.SoundTbl_LeapAttackJump = {
    "vj_recb/hunter/b3/hu_jump.wav"
}
    self.SoundTbl_LeapAttackDamage = {
    "vj_recb/hunter/b3/hu_slash.wav"
}
    self.SoundTbl_LeapAttackDamageMiss = {
    "vj_recb/hunter/b3/hu_miss.wav"
}
    self.SoundTbl_Pain = {
    "vj_recb/hunter/b3/hu_pain.wav"
}
    self.SoundTbl_Death = {
    "vj_recb/hunter/b3/hu_die.wav"
}
    self.SoundTbl_Impact = {
    "vj_recb/shared/hit_flesh1.wav",
    "vj_recb/shared/hit_flesh2.wav",
    "vj_recb/shared/hit_flesh3.wav",
    "vj_recb/shared/hit_flesh4.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
 if status == "Initial" then
    VJ_RECB_DeathCode(self)
end
 if status == "DeathAnim" then
    if hitgroup == HITGROUP_HEAD then
        self.AnimTbl_Death = {ACT_DIE_GUTSHOT,ACT_DIE_HEADSHOT}
    else
        self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE}
        end
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/