include("entities/npc_vj_recb_hunter/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b3/hunter.mdl"
ENT.AnimTbl_Flinch = {"flinch_back","flinch_forward"}
ENT.AnimTbl_LeapAttack = "jump"
ENT.TimeUntilLeapAttackDamage = 0.7
ENT.TimeUntilLeapAttackVelocity = 0.2
ENT.LeapAttackExtraTimers = false
ENT.AnimTbl_Death = {"die_back","die_forward_scream"}
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -35),
    FirstP_Bone = "Object_3",
    FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Hunter_Init()
    self.SoundTbl_FootStep = {
    "vj_recb/hunter/b3/hu_run.wav",
    "vj_recb/hunter/b3/hu_walk.wav"
}
    self.SoundTbl_MeleeAttackExtra =
    "vj_recb/hunter/b3/hu_slash.wav"

    self.SoundTbl_MeleeAttackMiss =
    "vj_recb/hunter/b3/hu_miss.wav"

    self.SoundTbl_LeapAttackJump =
    "vj_recb/hunter/b3/hu_jump.wav"

    self.SoundTbl_LeapAttackDamage =
    "vj_recb/hunter/b3/hu_slash.wav"

    self.SoundTbl_LeapAttackDamageMiss =
    "vj_recb/hunter/b3/hu_miss.wav"

    self.SoundTbl_Pain =
    "vj_recb/hunter/b3/hu_pain.wav"

    self.SoundTbl_Death =
    "vj_recb/hunter/b3/hu_die.wav"

    self.SoundTbl_Impact = {
    "vj_recb/shared/hit_flesh1.wav",
    "vj_recb/shared/hit_flesh2.wav",
    "vj_recb/shared/hit_flesh3.wav",
    "vj_recb/shared/hit_flesh4.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
    if status == "Init" then
        VJ_RECB_DeathCode(self)
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/