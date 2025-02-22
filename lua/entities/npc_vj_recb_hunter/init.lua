AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b2/hunter.mdl"
ENT.StartHealth = 300
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_recb_blood_red"}
ENT.BloodDecal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.FlinchHitGroupPlayDefault = true
ENT.FlinchHitGroupMap = {
{HitGroup = {HITGROUP_LEFTARM}, Animation = {ACT_FLINCH_LEFTARM}},
{HitGroup = {HITGROUP_RIGHTARM}, Animation = {ACT_FLINCH_RIGHTARM}},
{HitGroup = {HITGROUP_LEFTLEG}, Animation = {ACT_FLINCH_LEFTLEG}},
{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {ACT_FLINCH_RIGHTLEG}}
}
ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 30
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.HasLeapAttack = true
ENT.LeapAttackDamage = 36
ENT.AnimTbl_LeapAttack = ACT_RANGE_ATTACK1
ENT.LeapAttackDamageDistance = 60
ENT.TimeUntilLeapAttackDamage = 0.8
ENT.TimeUntilLeapAttackVelocity = 0.8
ENT.NextLeapAttackTime = 8
ENT.LeapAttackExtraTimers = {1, 1.2, 1.4, 1.6}
ENT.LeapAttackStopOnHit = true
ENT.LeapAttackMaxDistance = 300
ENT.LeapAttackMinDistance = 200
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
-- ====== Controller Data ====== --
ENT.ControllerParams = {
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
        self:ExecuteMeleeAttack()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_recb/hunter/hu_bodyfall.wav", 75, 100)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Hunter_Init()
    self.SoundTbl_FootStep = {
    "vj_recb/hunter/hu_runleft.wav",
    "vj_recb/hunter/hu_runright.wav"
}
    self.SoundTbl_Idle = {
    "vj_recb/hunter/hu_idle1.wav",
    "vj_recb/hunter/hu_idle2.wav",
    "vj_recb/hunter/hu_idle3.wav"
}
    self.SoundTbl_Alert = {
    "vj_recb/hunter/hu_alert.wav"
}
    self.SoundTbl_CallForHelp = {
    "vj_recb/hunter/hu_scream.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_recb/hunter/hu_alert.wav"
}
    self.SoundTbl_MeleeAttackExtra = {
    "vj_recb/hunter/hu_clawhit.wav"
}
    self.SoundTbl_MeleeAttackMiss = {
    "vj_recb/hunter/hu_slash.wav"
}
    self.SoundTbl_LeapAttackJump = {
    "vj_recb/hunter/hu_jump.wav"
}
    self.SoundTbl_LeapAttackDamage = {
    "vj_recb/hunter/hu_clawhit.wav"
}
    self.SoundTbl_Pain = {
    "vj_recb/hunter/hu_pain.wav"
}
    self.SoundTbl_Death = {
    "vj_recb/hunter/hu_die.wav"
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
    self:SetCollisionBounds(Vector(16, 16, 70), Vector(-16, -16, 0))
    self:Hunter_Init()
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCallForHelp(ally)
    self:PlayAnim("scream",true,false,true)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnLeapAttack(status,enemy)
    if status == "Jump" then
        return VJ.CalculateTrajectory(self, NULL, "Curve", self:GetPos() + self:OBBCenter(), self:GetEnemy():EyePos(), 1) + self:GetForward() * 80 - self:GetUp() * 30
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
 if status == "Init" then
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
        self.AnimTbl_Death = {ACT_DIE_GUTSHOT,ACT_DIE_HEADSHOT}
    else
        self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE}
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