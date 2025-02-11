AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b2/ant_boss.mdl"
ENT.StartHealth =  230
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW
ENT.BloodParticle = {"vj_recb_blood_yellow"}
ENT.BloodDecal = {"VJ_RECB_Blood_Yellow"}
ENT.HullType = HULL_LARGE
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 40
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
    ThirdP_Offset = Vector(25, 25, -25),
    FirstP_Bone = "Joint4",
    FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "melee" then
        self:MeleeAttackCode()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_recb/ant/ant_bodyfall.wav", 75, 100)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Ant_Init()
    self.SoundTbl_FootStep = {
    "vj_recb/ant/ant_walk.wav"
}
    self.SoundTbl_Idle = {
    "vj_recb/ant/ant_idle.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_recb/ant/ant_attack.wav"
}
    self.SoundTbl_MeleeAttackExtra = {
    "vj_recb/ant/ant_bite.wav"
}
    self.SoundTbl_MeleeAttackMiss = {
    "vj_recb/ant/ant_bitemiss.wav"
}
    self.SoundTbl_Pain = {
    "vj_recb/ant/ant_pain.wav"
}
    self.SoundTbl_Death = {
    "vj_recb/ant/ant_die.wav"
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
    self:SetSkin(math.random(0,1))
    self:SetCollisionBounds(Vector(30, 30, 45), Vector(-30, -30, 0))
    self:Ant_Init()
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