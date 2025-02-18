AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b2/licker.mdl"
ENT.StartHealth = 250
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_recb_blood_red"}
ENT.BloodDecal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = false
ENT.HasLeapAttack = true
ENT.LeapAttackDamage = 45
ENT.AnimTbl_LeapAttack = "jump"
ENT.LeapAttackDamageDistance = 80
ENT.TimeUntilLeapAttackDamage = 0.5
ENT.TimeUntilLeapAttackVelocity = 0.5
ENT.NextLeapAttackTime = 8
ENT.LeapAttackExtraTimers = {0.7, 0.9, 1.1, 1.3}
ENT.LeapAttackStopOnHit = true
ENT.LeapAttackMaxDistance = 300
ENT.LeapAttackMinDistance = 200
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = VJ.SET(100, 100)    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(25, 30, -25),
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
        VJ.EmitSound(self, "vj_recb/licker/li_bodyfall.wav", 75, 100)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Licker_Init()
    self.SoundTbl_FootStep = {
    "vj_recb/licker/li_walk.wav"
}
    self.SoundTbl_Idle = {
    "vj_recb/licker/li_idle.wav"
}
    self.SoundTbl_Alert = {
    "vj_recb/licker/li_idle.wav"
}
    self.SoundTbl_MeleeAttackMiss = {
    "vj_recb/shared/claw_miss1.wav",
    "vj_recb/shared/claw_miss2.wav"
}
    self.SoundTbl_LeapAttackJump = {
    "vj_recb/licker/li_jump.wav"
}
    self.SoundTbl_LeapAttackDamage = {
    "vj_recb/licker/li_slash.wav"
}
    self.SoundTbl_Pain = {
    "vj_recb/licker/li_pain.wav"
}
    self.SoundTbl_Death = {
    "vj_recb/licker/li_die.wav"
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
    self:SetCollisionBounds(Vector(20, 20, 32), Vector(-20, -20, 0))
    self:Licker_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)
    local attack = math.random(1,2)
    if attack == 1 then
        self.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
        self.MeleeAttackDamage = 35
        self.MeleeAttackDistance = 30
        self.MeleeAttackDamageDistance = 60
        self.SoundTbl_MeleeAttackExtra = "vj_recb/licker/li_slash.wav"
        self.HasMeleeAttackMissSounds = true
    elseif attack == 2 then
        self.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK2
        self.MeleeAttackDamage = 30
        self.MeleeAttackDistance = 30
        self.MeleeAttackDamageDistance = 70
        self.SoundTbl_MeleeAttackExtra = "vj_recb/licker/li_tongue.wav"
        self.HasMeleeAttackMissSounds = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetLeapAttackVelocity()
    return VJ.CalculateTrajectory(self, NULL, "Curve", self:GetPos() + self:OBBCenter(), self:GetEnemy():EyePos(), 1) + self:GetForward() * 100 - self:GetUp() * 50
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
 if status == "Initial" then
    VJ_RECB_DeathCode(self)
    if GetConVar("VJ_RECB_Gib"):GetInt() == 0 then return end
    if dmginfo:GetDamageForce():Length() < 800 then return end
    if hitgroup == HITGROUP_HEAD then
        self.HasDeathSounds = false
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_headburst.wav",75,100)
        self:SetBodygroup(0,1)
        self:RemoveAllDecals()

    /*if self.HasGibOnDeathEffects then
        local bloodEffect = ents.Create("info_particle_system")
        bloodEffect:SetKeyValue("effect_name","blood_advisor_pierce_spray")
        bloodEffect:SetPos(self:GetAttachment(self:LookupAttachment("head")).Pos)
        bloodEffect:SetAngles(self:GetAttachment(self:LookupAttachment("head")).Ang)
        bloodEffect:SetParent(self)
        bloodEffect:Fire("SetParentAttachment","head")
        bloodEffect:Spawn()
        bloodEffect:Activate()
        bloodEffect:Fire("Start","",0)
        bloodEffect:Fire("Kill","",5)
        end*/
    end
end
 if status == "DeathAnim" then
    if hitgroup == HITGROUP_HEAD then
        self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
    else
        self.AnimTbl_Death = {ACT_DIESIMPLE}
        end
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