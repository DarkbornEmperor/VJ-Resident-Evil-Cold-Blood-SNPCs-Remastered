include("entities/npc_vj_recb_crimsonhead/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b3/zombie_crimsonhead_researcher.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Init()
    self:SetBodygroup(0,1)
    self:SetSkin(math.random(0,3))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)
 if status == "PostDamage" then
 if GetConVar("VJ_RECB_Dismember"):GetInt() == 0 then return end
    local chest = {2} -- Chest
    local lArm = {4} -- Left Arm
    local rArm = {5} -- Right Arm
    if VJ.HasValue(chest,hitgroup) then
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
    if hitgroup == HITGROUP_CHEST then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("chest")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_armlost.wav",75,100)
        self:SetBodygroup(4,1)
        self:SetBodygroup(0,0)
        self:RemoveAllDecals()
    elseif hitgroup == HITGROUP_LEFTARM then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("larm")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_armlost.wav",75,100)
        self:SetBodygroup(6,1)
        self:SetBodygroup(0,0)
        self:RemoveAllDecals()
    elseif hitgroup == HITGROUP_RIGHTARM then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("rarm")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_armlost.wav",75,100)
        self:SetBodygroup(5,1)
        self:SetBodygroup(0,0)
        self:RemoveAllDecals()
    elseif hitgroup == HITGROUP_LEFTLEG then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("lleg")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_leglost.wav",75,100)
        self:SetBodygroup(3,1)
        self:SetBodygroup(0,0)
        self:RemoveAllDecals()
    elseif hitgroup == HITGROUP_RIGHTLEG then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("rleg")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_leglost.wav",75,100)
        self:SetBodygroup(2,1)
        self:SetBodygroup(0,0)
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
        self:SetBodygroup(1,1)
        self:SetBodygroup(0,0)
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
    if hitgroup == HITGROUP_HEAD then
        self.AnimTbl_Death = {ACT_DIE_HEADSHOT,ACT_DIE_GUTSHOT}
     else
        self.AnimTbl_Death = {ACT_DIESIMPLE,ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIEVIOLENT,ACT_DIE_CHESTSHOT,ACT_DIE_GUTSHOT,ACT_DIE_BACKSHOT}
end
     if self.Crippled then
        self.AnimTbl_Death = {"vjseq_crawl_die"}
     elseif self.HasBeenKnocked then
        self.AnimTbl_Death = {"floor_death"}
        end
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/