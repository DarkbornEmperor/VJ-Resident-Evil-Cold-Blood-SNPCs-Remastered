include("entities/npc_vj_recb_cerberus/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b3/dog.mdl"
ENT.HasMeleeAttack = false
ENT.HasLeapAttack = true
ENT.AnimTbl_LeapAttack = "jump_over"
ENT.NextLeapAttackTime = 4
ENT.LeapAttackDamageDistance = 50
ENT.LeapAttackDamage = 15
ENT.LeapAttackExtraTimers = {0.6, 0.8, 1}
ENT.LeapAttackStopOnHit = true
ENT.LeapAttackVelocityForward = 100
ENT.LeapAttackVelocityUp = 100
ENT.LeapAttackMaxDistance = 200
ENT.LeapAttackMinDistance = 1
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Cerberus_Init()
    self.SoundTbl_FootStep =
    "vj_recb/cerberus/b3/dog_step.wav"

    self.SoundTbl_Idle =
    "vj_recb/cerberus/b3/dog_growl.wav"

    self.SoundTbl_CombatIdle = {
    "vj_recb/cerberus/b3/dog_bark.wav",
    "vj_recb/cerberus/b3/dog_growl.wav"
}
    self.SoundTbl_LeapAttackJump =
    "vj_recb/cerberus/b3/dog_attack.wav"

    self.SoundTbl_LeapAttackDamage =
    "vj_recb/cerberus/b3/dog_eat.wav"

    self.SoundTbl_CallForHelp =
    "vj_recb/cerberus/b3/dog_howl.wav"

    self.SoundTbl_Pain =
    "vj_recb/cerberus/b3/dog_pain.wav"

    self.SoundTbl_Death =
    "vj_recb/cerberus/b3/dog_die.wav"

    self.SoundTbl_Impact = {
    "vj_recb/shared/hit_flesh1.wav",
    "vj_recb/shared/hit_flesh2.wav",
    "vj_recb/shared/hit_flesh3.wav",
    "vj_recb/shared/hit_flesh4.wav"
}
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
    if math.random(1,2) == 1 then
        self:PlayAnim("bark",true,false,true)
        self.SoundTbl_Alert = "vj_recb/cerberus/b3/dog_bark.wav"
    else
        self:PlayAnim("growl",true,false,true)
        self.SoundTbl_Alert = "vj_recb/cerberus/b3/dog_growl.wav"
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
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/