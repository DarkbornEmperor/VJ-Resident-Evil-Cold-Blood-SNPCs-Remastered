AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b2/tyrant_103.mdl"
ENT.StartHealth = 3000
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.VJ_ID_Boss = true
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_recb_blood_red"}
ENT.BloodDecal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.HasMeleeAttack = true
ENT.MeleeAttackDamage = 40
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 80
ENT.TimeUntilMeleeAttackDamage = false
ENT.HasMeleeAttackKnockBack = true
ENT.MeleeAttackPlayerSpeed = true
ENT.HasMeleeAttackSlowPlayerSound = false
ENT.MeleeAttackPlayerSpeedWalk = 100
ENT.MeleeAttackPlayerSpeedRun = 100
ENT.MeleeAttackPlayerSpeedTime = 0.8
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasSoundTrack = true
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = VJ.SET(100, 100)
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
    ThirdP_Offset = Vector(20, 25, -60), -- The offset for the controller when the camera is in third person
    FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
    FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "melee" then
        self:ExecuteMeleeAttack()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_recb/tyrant103/ty_bodydrop.wav", 75, 100)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_RECB_BossMusic"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tyrant_Init()
    self.SoundTbl_FootStep = {
    "vj_recb/tyrant103/ty_walk.wav"
}
    self.SoundTbl_MeleeAttackExtra = {
    "vj_recb/tyrant103/ty_punch.wav"
}
    self.SoundTbl_MeleeAttackMiss = {
    "vj_recb/tyrant103/ty_swing.wav"
}
    self.SoundTbl_Impact = {
    "vj_recb/shared/hit_flesh1.wav",
    "vj_recb/shared/hit_flesh2.wav",
    "vj_recb/shared/hit_flesh3.wav",
    "vj_recb/shared/hit_flesh4.wav"
}
    self.SoundTbl_SoundTrack = {
    "vj_recb/tyrant103/RECB_-_tyrant.mp3"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(18, 18, 90), Vector(-18, -18, 0))
    self:Tyrant_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(hitEnt)
    return self:GetForward()*180 + self:GetUp()*80
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
    if status == "Initial" then
        VJ_RECB_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_RECB_ApplyCorpse(self,corpseEnt)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/