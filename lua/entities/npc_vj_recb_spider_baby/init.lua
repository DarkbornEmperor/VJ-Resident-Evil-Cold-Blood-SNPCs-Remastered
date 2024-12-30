AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b1/babyspider.mdl"
ENT.StartHealth = 5
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.CanOpenDoors = false
ENT.Behavior = VJ_BEHAVIOR_PASSIVE_NATURE
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW
ENT.CustomBlood_Particle = {"vj_recb_blood_yellow"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Yellow"}
ENT.HullType = HULL_TINY
ENT.HasMeleeAttack = false
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
    -- ====== Controller Data ====== --
ENT.VJC_Data = {
    CameraMode = 1,
    ThirdP_Offset = Vector(40, 20, -50),
    FirstP_Bone = "Joint 18",
    FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:BabySpider_Init()
    self.SoundTbl_Impact = {
    "vj_recb/shared/hit_flesh1.wav",
    "vj_recb/shared/hit_flesh2.wav",
    "vj_recb/shared/hit_flesh3.wav",
    "vj_recb/shared/hit_flesh4.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(2, 2, 2), Vector(-2, -2, 0))
    self:BabySpider_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTouch(ent)
    if ent:IsPlayer() or ent:IsNPC() then
        self:TakeDamage(self:Health() + 1, ent, ent)
        VJ.EmitSound(self, "vj_recb/spider/mini_spider_crush.wav", 75, 100)
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/