AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b2/cerberus.mdl"
ENT.StartHealth = 110
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.CustomBlood_Particle = {"vj_recb_blood_red"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_MEDIUM
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = 0.4
ENT.MeleeAttackDamage = 30
ENT.MeleeAttackDistance = 25
ENT.MeleeAttackDamageDistance = 60
ENT.HasLeapAttack = true
ENT.AnimTbl_LeapAttack = "jump_window"
ENT.NextLeapAttackTime = 8
ENT.LeapAttackDamageDistance = 50
ENT.LeapAttackDamage = 15
ENT.TimeUntilLeapAttackDamage = 0.4
ENT.LeapAttackExtraTimers = {0.6, 0.8, 1}
ENT.StopLeapAttackAfterFirstHit = true
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
    -- ====== Controller Data ====== --
ENT.VJC_Data = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -30),
    FirstP_Bone = "Bone08",
    FirstP_Offset = Vector(0, 0, 5),
}
-- Sleeping
ENT.Cerberus_IdleState = "N"
ENT.Cerberus_InTransition = false
ENT.Cerberus_NextGetUpT = 0
ENT.Cerberus_NextSleepT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:FootStepSoundCode()
    elseif key == "melee" then
        self:MeleeAttackCode()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_recb/cerberus/cer_bodyfall.wav", 75, 100)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Cerberus_Init()
    self.SoundTbl_FootStep = {
    "vj_recb/cerberus/cer_run.wav",
    "vj_recb/cerberus/cer_run2.wav"
}
    self.SoundTbl_Idle = {
    "vj_recb/cerberus/cer_growl.wav"
}
    self.SoundTbl_CombatIdle = {
    "vj_recb/cerberus/cer_bark.wav",
    "vj_recb/cerberus/cer_growl.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_recb/cerberus/cer_bite.wav"
}
    self.SoundTbl_MeleeAttackExtra = {
    "vj_recb/cerberus/Bite.wav"
}
    self.SoundTbl_LeapAttackJump = {
    "vj_recb/cerberus/cer_jump.wav"
}
    self.SoundTbl_LeapAttackDamage = {
    "vj_recb/cerberus/Bite.wav"
}
    self.SoundTbl_CallForHelp = {
    "vj_recb/cerberus/cer_howl.wav"
}
    self.SoundTbl_Pain = {
    "vj_recb/cerberus/cer_pain.wav",
    "vj_recb/cerberus/cer_pain2.wav"
}
    self.SoundTbl_Death = {
    "vj_recb/cerberus/cer_die.wav"
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
    self:SetCollisionBounds(Vector(15, 15, 40), Vector(-15, -15, 0))
    self:Cerberus_Init()
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
    if math.random(1,2) == 1 then
        self:PlayAnim("bark",true,false,true)
        self.SoundTbl_Alert = {"vj_recb/cerberus/cer_alert.wav"}
    else
        self:PlayAnim("growl",true,false,true)
        self.SoundTbl_Alert = {"vj_recb/cerberus/cer_growl.wav"}
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCallForHelp(ally)
    self:PlayAnim("growl",true,false,true)
end
---------------------------------------------------------------------------------------------------------------------------------------------
/*function ENT:OnThinkActive()
if GetConVar("VJ_RECB_CerberusSleep"):GetInt() == 0 or self.DeathAnimationCodeRan then return end
    if !self.VJ_IsBeingControlled && self.Cerberus_IdleState != "N" && (self:IsMoving() or CurTime() > self.Cerberus_NextGetUpT) then
        self:PlayAnim("sleeptostand",true,false)
        self.Cerberus_IdleState = "N"
        self.DisableWandering = false
        self.DisableChasingEnemy = false
        self.Cerberus_NextSleepT = CurTime() + 10
end

        if !self.VJ_IsBeingControlled && IsValid(self:GetEnemy()) then
            if self.Cerberus_IdleState != "N" && self.Cerberus_InTransition == false then
                self.Cerberus_InTransition = true
                self:PlayAnim("sleeptostand",true,false,false,0,{},function(vsched)
                    vsched.RunCode_OnFinish = function()
                        self.Cerberus_InTransition = false
                        self.Cerberus_IdleState = "N"
    end
end)
                self.DisableWandering = false
                self.DisableChasingEnemy = false
    end
end
            if !self.VJ_IsBeingControlled && self.Cerberus_IdleState == "N" && !self:IsMoving() && CurTime() > self.Cerberus_NextGetUpT && math.random(1,150) == 1 then
                self:PlayAnim("gotosleep",true,false)
                self.Cerberus_IdleState = "S"
                self.DisableWandering = true
                self.DisableChasingEnemy = true
                self.Cerberus_NextGetUpT = CurTime() + 20 //math.Rand(10,35)
end

            if !self.VJ_IsBeingControlled && self.Cerberus_IdleState == "N" then
                self.AnimTbl_IdleStand = {ACT_IDLE}
            elseif  self.Cerberus_IdleState == "S" then
                self.AnimTbl_IdleStand = {"sleep"}
    end
end*/
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetLeapAttackVelocity()
    return VJ.CalculateTrajectory(self, NULL, "Curve", self:GetPos() + self:OBBCenter(), self:GetEnemy():EyePos(), 1) + self:GetForward() * 80 - self:GetUp() * 30
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
        bloodEffect:Fire("Kill","",5) end*/
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_RECB_ApplyCorpse(self,corpseEnt)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/