include("entities/npc_vj_recb_spider_giant/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b2/black_tiger.mdl"
ENT.StartHealth = 800
ENT.VJ_ID_Boss = true
ENT.MeleeAttackDistance = 80
ENT.MeleeAttackDamageDistance = 160
ENT.HasSoundTrack = true
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(-40, 25, -25),
    FirstP_Bone = "Joint 15",
    FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_RECB_BossMusic"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Spider_Init()
    self.SoundTbl_MeleeAttackExtra = {
    "vj_recb/spider/spider_bite.wav",
    "vj_recb/spider/spider_bite2.wav"
}
    self.SoundTbl_MeleeAttackMiss = {
    "vj_recb/shared/claw_miss1.wav",
    "vj_recb/shared/claw_miss2.wav"
}
    self.SoundTbl_RangeAttack = {
    "vj_recb/spider/sp_spit.wav"
}
    self.SoundTbl_Impact = {
    "vj_recb/shared/hit_flesh1.wav",
    "vj_recb/shared/hit_flesh2.wav",
    "vj_recb/shared/hit_flesh3.wav",
    "vj_recb/shared/hit_flesh4.wav"
}
    self.SoundTbl_SoundTrack = {
    "vj_recb/mapspawner/spidersrevenge.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetSkin(math.random(0,1))
    self:SetCollisionBounds(Vector(60, 60, 70), Vector(-60, -60, 0))
    self:Spider_Init()
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/