AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b2/flyclaw.mdl"
ENT.StartHealth = 200
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_recb_blood_red"}
ENT.BloodDecal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 30
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
    -- ====== Controller Data ====== --
ENT.ControllerVars = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -35),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "melee" then
        self:MeleeAttackCode()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_recb/flyclaw/fl_fall.wav", 75, 100)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Flyclaw_Init()
    self.SoundTbl_FootStep = {
    "vj_recb/flyclaw/fl_walk.wav"
}
    self.SoundTbl_Idle = {
    "vj_recb/flyclaw/fl_idle.wav",
    "vj_recb/flyclaw/fl_idle2.wav",
    "vj_recb/flyclaw/fl_idle3.wav"
}
    self.SoundTbl_Alert = {
    "vj_recb/flyclaw/fl_alrt.wav"
}
    self.SoundTbl_CombatIdle = {
    "vj_recb/flyclaw/fl_ang.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_recb/flyclaw/fl_att.wav"
}
    self.SoundTbl_MeleeAttackExtra = {
    "vj_recb/flyclaw/fl_slash.wav"
}
    self.SoundTbl_MeleeAttackMiss = {
    "vj_recb/shared/claw_miss1.wav",
    "vj_recb/shared/claw_miss2.wav"
}
    self.SoundTbl_Pain = {
    "vj_recb/flyclaw/fl_dam.wav"
}
    self.SoundTbl_Death = {
    "vj_recb/flyclaw/fl_out.wav"
}
    self.SoundTbl_Impact = {
    "vj_recb/shared/hit_flesh1.wav",
    "vj_recb/shared/hit_flesh2.wav",
    "vj_recb/shared/hit_flesh3.wav",
    "vj_recb/shared/hit_flesh4.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(18, 18, 62), Vector(-18, -18, 0))
    self:Flyclaw_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFlinch(dmginfo,hitgroup,status)
 if status == "PriorExecution" then
    if dmginfo:GetDamage() > 30 then
        self.AnimTbl_Flinch = ACT_BIG_FLINCH
    else
        self.AnimTbl_Flinch = ACT_SMALL_FLINCH
        end
    end
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