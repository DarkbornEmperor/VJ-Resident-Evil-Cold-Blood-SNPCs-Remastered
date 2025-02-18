AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b2/neptune.mdl"
ENT.StartHealth = 500
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.VJ_ID_Boss = true
ENT.MovementType = VJ_MOVETYPE_AQUATIC
ENT.Aquatic_SwimmingSpeed_Calm = 80
ENT.Aquatic_SwimmingSpeed_Alerted = 200
ENT.Aquatic_AnimTbl_Calm = ACT_WALK
ENT.Aquatic_AnimTbl_Alerted = ACT_RUN
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_recb_blood_red"}
ENT.BloodDecal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_LARGE
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasMeleeAttack = true
ENT.MeleeAttackDamage = 35
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 100
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {ACT_DIESIMPLE,ACT_DIEVIOLENT}
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = VJ.SET(100, 100)
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(20, 30, -60),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "melee" then
        self:ExecuteMeleeAttack()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Neptune_Init()
    self.SoundTbl_Breath = {
    "vj_recb/shark/shark_swim_peace.wav"
}
    self.SoundTbl_Alert = {
    "vj_recb/shark/Shark_Alert.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_recb/shark/Shark_attack.wav"
}
    self.SoundTbl_MeleeAttackExtra = {
    "vj_recb/shark/shark_bite.wav"
}
    self.SoundTbl_Pain = {
    "vj_recb/shark/Shark_pain.wav"
}
    self.SoundTbl_Death = {
    "vj_recb/shark/Shark_death.wav"
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
    self:SetCollisionBounds(Vector(60, 60, 60), Vector(-60, -60, 0))
    self:Neptune_Init()
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