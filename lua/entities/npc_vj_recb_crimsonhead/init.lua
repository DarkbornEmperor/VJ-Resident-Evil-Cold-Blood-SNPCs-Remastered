AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b2/zombie_crimsonhead.mdl"
ENT.StartHealth =  325
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_recb_blood_red"}
ENT.BloodDecal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 30
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackKnockBack_Forward1 = -100
ENT.MeleeAttackKnockBack_Forward2 = -100
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.BreathSoundLevel = 75
ENT.MainSoundPitch = VJ.SET(100, 100)
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(40, 25, -50),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
-- Custom
ENT.HeadHealth = 20
ENT.ChestHealth = 30
ENT.RArmHealth = 15
ENT.LArmHealth = 15
ENT.Head_Damaged = false
ENT.Chest_Damaged = false
ENT.RArm_Damaged = false
ENT.LArm_Damaged = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "step_getup" then
        VJ.EmitSound(self,"vj_recb/zombie/footstep"..math.random(1,3)..".wav",70,100)
    elseif key == "melee" then
        self:ExecuteMeleeAttack()
    elseif key == "death_knee" then
        VJ.EmitSound(self,"vj_recb/zombie/zom_knee.wav",75,100)
    elseif key == "death" then
        VJ.EmitSound(self,"vj_recb/zombie/zom_bodyfall"..math.random(1,2)..".wav",75,100)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:ZombieVoices()
    self:Zombie_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Init()
 self:SetBodygroup(0,1)
 local zombieSkin = math.random(1,2)
 if zombieSkin == 1 then
    self:SetSkin(math.random(0,3))
 elseif zombieSkin == 2 && math.random(1,3) == 1 then
    self:SetSkin(math.random(4,5))
    self:SetBodygroup(7,math.random(0,1))
end
    self.SoundTbl_FootStep = {
    "vj_recb/zombie/footstep1.wav",
    "vj_recb/zombie/footstep2.wav",
    "vj_recb/zombie/footstep3.wav"
}
    self.SoundTbl_MeleeAttackMiss = {
    "vj_recb/shared/claw_miss1.wav",
    "vj_recb/shared/claw_miss2.wav"
}
    self.SoundTbl_Impact = {
    "vj_recb/shared/hit_flesh1.wav",
    "vj_recb/shared/hit_flesh2.wav",
    "vj_recb/shared/hit_flesh3.wav",
    "vj_recb/shared/hit_flesh4.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoices()
    local voice = math.random(1,2)
    if voice == 1 then
        self.SoundTbl_Idle = {
        "vj_recb/zombie/crimsonhead/crimhead_run.wav"
}
        self.SoundTbl_Alert = {
        "vj_recb/zombie/crimsonhead/crimhead_alert.wav"
}
        self.SoundTbl_BeforeMeleeAttack = {
        "vj_recb/zombie/crimsonhead/crimhead_attack1.wav",
        "vj_recb/zombie/crimsonhead/crimhead_attack2.wav"
}
        self.SoundTbl_MeleeAttackExtra = {
        "vj_recb/zombie/crimsonhead/crimhead_slash.wav"
}
        self.SoundTbl_Pain = {
        "vj_recb/zombie/crimsonhead/crimhead_pain.wav"
}
        self.SoundTbl_Death = {
        "vj_recb/zombie/crimsonhead/crimhead_die.wav"
}
    elseif voice == 2 then
        self.SoundTbl_Breath = {
        "vj_recb/zombie/b2/crimsonhead/crimhead_run.wav"
}
        self.SoundTbl_Alert = {
        "vj_recb/zombie/b2/crimsonhead/crimhead_alert.wav"
}
        self.SoundTbl_BeforeMeleeAttack = {
        "vj_recb/zombie/b2/crimsonhead/crimhead_attack1.wav",
        "vj_recb/zombie/b2/crimsonhead/crimhead_attack2.wav"
}
        self.SoundTbl_MeleeAttackExtra = {
        "vj_recb/zombie/b2/crimsonhead/crimhead_slash.wav"
}
        self.SoundTbl_Pain = {
        "vj_recb/zombie/b2/crimsonhead/crimhead_pain.wav"
}
        self.SoundTbl_Death = {
        "vj_recb/zombie/b2/crimsonhead/crimhead_die.wav"
}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)
 if status == "PostDamage" then
 if GetConVar("VJ_RECB_Dismember"):GetInt() == 0 then return end
    local head = {1} -- Head
    local chest = {2} -- Chest
    local lArm = {4} -- Left Arm
    local rArm = {5} -- Right Arm
    if VJ.HasValue(head,hitgroup) then
        self.HeadHealth = self.HeadHealth -dmginfo:GetDamage()
    if !self.Head_Damaged && hitgroup == HITGROUP_HEAD && self.HeadHealth <= 0 && self:Health() > 0 then
        self.Head_Damaged = true
        self:Dismember(hitgroup)
end
    elseif VJ.HasValue(chest,hitgroup) then
        self.ChestHealth = self.ChestHealth -dmginfo:GetDamage()
    if !self.Chest_Damaged && hitgroup == HITGROUP_CHEST && self.ChestHealth <= 0 && self:Health() > 0 then
        self.Chest_Damaged = true
        self:Dismember(hitgroup)
end
    elseif VJ.HasValue(lArm,hitgroup) then
        self.LArmHealth = self.LArmHealth -dmginfo:GetDamage()
    if !self.LArm_Damaged && hitgroup == HITGROUP_LEFTARM && self.LArmHealth <= 0 && self:Health() > 0 then
        self.LArm_Damaged = true
        self:Dismember(hitgroup)
end
    elseif VJ.HasValue(rArm,hitgroup) then
        self.RArmHealth = self.RArmHealth -dmginfo:GetDamage()
    if !self.RArm_Damaged && hitgroup == HITGROUP_RIGHTARM && self.RArmHealth <= 0 && self:Health() > 0 then
        self.RArm_Damaged = true
        self:Dismember(hitgroup) end
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Dismember(hitgroup)
    if hitgroup == HITGROUP_HEAD then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_neck_break.wav",75,100)
        self:SetBodygroup(0,0)
        self:SetBodygroup(1,2)
        self:SetBodygroup(7,0)
        self:RemoveAllDecals()
    elseif hitgroup == HITGROUP_CHEST then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("chest")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_armlost.wav",75,100)
        self:SetBodygroup(0,0)
        self:SetBodygroup(4,1)
        self:RemoveAllDecals()
    elseif hitgroup == HITGROUP_LEFTARM then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("larm")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_armlost.wav",75,100)
        self:SetBodygroup(0,0)
        self:SetBodygroup(6,1)
        self:RemoveAllDecals()
    elseif hitgroup == HITGROUP_RIGHTARM then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("rarm")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_armlost.wav",75,100)
        self:SetBodygroup(0,0)
        self:SetBodygroup(5,1)
        self:RemoveAllDecals()
    elseif hitgroup == HITGROUP_LEFTLEG then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("lleg")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_leglost.wav",75,100)
        self:SetBodygroup(0,0)
        self:SetBodygroup(3,1)
        self:RemoveAllDecals()
    elseif hitgroup == HITGROUP_RIGHTLEG then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("rleg")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_leglost.wav",75,100)
        self:SetBodygroup(0,0)
        self:SetBodygroup(2,1)
        self:RemoveAllDecals()
    end
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
        self:SetBodygroup(0,0)
        self:SetBodygroup(1,3)
        self:SetBodygroup(7,0)
        self:RemoveAllDecals()
    elseif hitgroup == HITGROUP_CHEST && !self.Chest_Damaged then
        self:Dismember(hitgroup)
    elseif hitgroup == HITGROUP_LEFTARM && !self.LArm_Damaged then
        self:Dismember(hitgroup)
    elseif hitgroup == HITGROUP_RIGHTARM && !self.RArm_Damaged then
        self:Dismember(hitgroup)
    elseif hitgroup == HITGROUP_LEFTLEG then
        self:Dismember(hitgroup)
    elseif hitgroup == HITGROUP_RIGHTLEG then
        self:Dismember(hitgroup)

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
    if hitgroup == HITGROUP_HEAD && !self.Crippled then
        self.AnimTbl_Death = {ACT_DIE_HEADSHOT,ACT_DIE_GUTSHOT}
     else
        self.AnimTbl_Death = {ACT_DIESIMPLE,ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIEVIOLENT,ACT_DIE_CHESTSHOT,ACT_DIE_GUTSHOT,ACT_DIE_BACKSHOT}
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