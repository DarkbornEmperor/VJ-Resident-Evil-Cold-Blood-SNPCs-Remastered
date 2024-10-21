AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b3/dog.mdl"
ENT.StartHealth = 110
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"vj_recb_blood_red"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_MEDIUM
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasMeleeAttack = false
ENT.HasLeapAttack = true
ENT.AnimTbl_LeapAttack = "jump_over"
ENT.NextLeapAttackTime = 4
ENT.LeapAttackDamageDistance = 50
ENT.LeapAttackDamage = 15
ENT.TimeUntilLeapAttackDamage = false
//ENT.LeapAttackExtraTimers = {0.6, 0.8, 1}
ENT.StopLeapAttackAfterFirstHit = true
ENT.LeapAttackVelocityForward = 100
ENT.LeapAttackVelocityUp = 100
ENT.LeapDistance = 200
ENT.LeapToMeleeDistance = 1
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.DisableFootStepSoundTimer = true
ENT.HasExtraMeleeAttackSounds = true
    -- ====== Controller Data ====== --
ENT.VJC_Data = {
    CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
    ThirdP_Offset = Vector(30, 25, -30), -- The offset for the controller when the camera is in third person
    FirstP_Bone = "Object_3", -- If left empty, the base will attempt to calculate a position for first person
    FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
    -- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_recb/cerberus/b3/dog_step.wav"}
ENT.SoundTbl_Idle = {"vj_recb/cerberus/b3/dog_growl.wav"}
ENT.SoundTbl_CombatIdle = {"vj_recb/cerberus/b3/dog_bark.wav","vj_recb/cerberus/b3/dog_growl.wav"}
ENT.SoundTbl_LeapAttackJump = {"vj_recb/cerberus/b3/dog_attack.wav"}
ENT.SoundTbl_LeapAttackDamage = {"vj_recb/cerberus/b3/dog_eat.wav"}
ENT.SoundTbl_CallForHelp = {"vj_recb/cerberus/b3/dog_howl.wav"}
ENT.SoundTbl_Pain = {"vj_recb/cerberus/b3/dog_pain.wav"}
ENT.SoundTbl_Death = {"vj_recb/cerberus/b3/dog_die.wav"}
ENT.SoundTbl_Impact = {"vj_recb/shared/hit_flesh1.wav","vj_recb/shared/hit_flesh2.wav","vj_recb/shared/hit_flesh3.wav","vj_recb/shared/hit_flesh4.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:FootStepSoundCode()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_recb/cerberus/b3/dog_bodyfall.wav", 75, 100)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(15, 15, 40), Vector(-15, -15, 0))
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert()
    if math.random(1,2) == 1 then
        self:VJ_ACT_PLAYACTIVITY("bark",true,0.5,true)
        self.SoundTbl_Alert = {"vj_recb/cerberus/dog_bark.wav"}
    else
        self:VJ_ACT_PLAYACTIVITY("growl",true,false,true)
        self.SoundTbl_Alert = {"vj_recb/cerberus/dog_growl.wav"}
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCallForHelp(ally)
    self:VJ_ACT_PLAYACTIVITY("howl",true,fslse,true)
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
        self:SetBodygroup(1,1)
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