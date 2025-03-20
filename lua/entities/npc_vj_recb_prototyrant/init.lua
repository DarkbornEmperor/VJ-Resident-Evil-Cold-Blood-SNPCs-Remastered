AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b2/proto_tyrant.mdl"
ENT.StartHealth = 3000
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.VJ_ID_Boss = true
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_recb_blood_red"}
ENT.BloodDecal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 40
ENT.MeleeAttackPlayerSpeed = true
ENT.HasMeleeAttackPlayerSpeedSounds = false
ENT.MeleeAttackPlayerSpeedWalk = 100
ENT.MeleeAttackPlayerSpeedRun = 100
ENT.MeleeAttackPlayerSpeedTime = 0.8
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIEVIOLENT
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasSoundTrack = true
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
-- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(20, 25, -70),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "melee" then
        self:ExecuteMeleeAttack()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_recb/tyrant/tyrant_bodyhit.wav", 75, 100)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_RECB_BossMusic"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ProtoTyrant_Init()
    self.SoundTbl_FootStep = {
    "vj_recb/tyrant/tyrant_foot.wav"
}
    self.SoundTbl_Alert = {
    "vj_recb/tyrant/tyrant_roar.wav"
}
    self.SoundTbl_MeleeAttackMiss = {
    "vj_recb/tyrant/tyrant_swing2.wav",
    "vj_recb/tyrant/tyrant_swing.wav"
}
    self.SoundTbl_MeleeAttackExtra = {
    "vj_recb/tyrant/tyrant_stab.wav",
    "vj_recb/tyrant/tyrant_slash.wav"
}
    self.SoundTbl_Impact = {
    "vj_recb/shared/hit_flesh1.wav",
    "vj_recb/shared/hit_flesh2.wav",
    "vj_recb/shared/hit_flesh3.wav",
    "vj_recb/shared/hit_flesh4.wav"
}
    self.SoundTbl_SoundTrack = {
    "vj_recb/mapspawner/mansionbossend.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(20, 20, 100), Vector(-20, -20, 0))
    self:ProtoTyrant_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
 if act == ACT_RUN && self.EnemyData.Distance < 250 && IsValid(self:GetEnemy()) then
    return ACT_WALK
end
    return self.BaseClass.TranslateActivity(self,act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttack(status,enemy)
    if status == "Init" then
    local attack = math.random(1,2)
    if attack == 1 then
        self.AnimTbl_MeleeAttack = "vjseq_attack1"
        self.MeleeAttackDistance = 35
        self.MeleeAttackDamageDistance = 80
        self.HasMeleeAttackKnockBack = true
    elseif attack == 2 then
        self.AnimTbl_MeleeAttack = "vjseq_attack2"
        self.MeleeAttackDistance = 30
        self.MeleeAttackDamageDistance = 70
        self.HasMeleeAttackKnockBack = false
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(ent)
    return self:GetForward()*180 + self:GetUp()*80
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
    if status == "Init" then
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