include("entities/npc_vj_recb_zombie_male/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b1/zombie_female.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoices()
    self.SoundTbl_Idle =
    "vj_recb/zombie/b1/female/zof_idle.wav"

    self.SoundTbl_Alert =
    "vj_recb/zombie/b1/female/zof_idle.wav"

    self.SoundTbl_BeforeMeleeAttack =
    "vj_recb/zombie/b1/female/zof_attack.wav"

    self.SoundTbl_Pain =
    "vj_recb/zombie/b1/female/zof_pain.wav"

    self.SoundTbl_Death =
    "vj_recb/zombie/b1/female/zof_die.wav"
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Init()
    self:SetSkin(math.random(0,2))
    self.SoundTbl_FootStep = {
    "vj_recb/zombie/b1/footstep1.wav",
    "vj_recb/zombie/b1/footstep2.wav",
    "vj_recb/zombie/b1/footstep3.wav",
    "vj_recb/zombie/b1/footstep4.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttack(status,enemy)
    if status == "Init" then
        self.AnimTbl_MeleeAttack = "attack2"
        self.MeleeAttackDamageType = DMG_SLASH
        self.MeleeAttackDamage = 25
        self.HasMeleeAttackKnockBack = true
        self.MeleeAttackPlayerSpeed = true
        self.SoundTbl_MeleeAttackExtra = {"vj_recb/zombie/bite1.wav","vj_recb/zombie/bite2.wav"}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status,ent,isProp)
   if status == "PreDamage" then
   if self:IsOnFire() then ent:Ignite(4) end
   if !isProp && self:GetSequence() == self:LookupSequence("attack2") then
   if ent.IsVJBaseSNPC && VJ.PICK(ent.BloodParticle) then ParticleEffectAttach(VJ.PICK(ent.BloodParticle),PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
   elseif (ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then ParticleEffectAttach("blood_impact_red_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
    end
end
 if self:GetSequence() == self:LookupSequence("attack2") then
 if ent.IsVJBaseSNPC && (ent.MovementType != VJ_MOVETYPE_GROUND or ent.VJ_ID_Boss or ent.IsVJBaseSNPC_Tank) then self.RECB_Grappled = false return false end
 if !self.RECB_Grappled then
    self.RECB_Grappled = true
    //ent:SetVelocity(self:MeleeAttackKnockbackVelocity(ent))
 if self.RECB_CurEnt != ent then -- If the grabbed enemy is a new enemy then reset the enemy values
    self:ResetGrapple()
    self.RECB_CurEntMoveType = ent:GetMoveType()
end
 if ent:IsPlayer() or (ent.IsVJBaseSNPC && ent.MovementType == VJ_MOVETYPE_GROUND && !ent.VJ_ID_Boss && !ent.IsVJBaseSNPC_Tank) then
    self:Grapple()
end
   if ent:IsNPC() && !ent.IsVJBaseSNPC && ent:GetMoveType(MOVETYPE_STEP) then
        self:Grapple_NPC() end
        end
    end
end
    if status == "Miss" then
    if self.Crippled or self:GetSequence() == self:LookupSequence("vomit") then return end
        self.AttackAnimTime = 0
        self:StopAttacks(false)
        self.vACT_StopAttacks = false
        self:PlayAnim("flinch",true,false,false)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status) return end
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
    if status == "DeathAnim" then
    if hitgroup == HITGROUP_HEAD && !self.Crippled then
        self.AnimTbl_Death = {ACT_DIE_HEADSHOT,ACT_DIE_GUTSHOT}
     else
        self.AnimTbl_Death = {ACT_DIESIMPLE,ACT_DIEFORWARD,ACT_DIE_GUTSHOT}
        end
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/