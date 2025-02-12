include("entities/npc_vj_recb_zombie_male/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b1/zombie.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Init()
    self:SetSkin(math.random(0,5))
    self.SoundTbl_FootStep = {
    "vj_recb/zombie/b1/footstep1.wav",
    "vj_recb/zombie/b1/footstep2.wav",
    "vj_recb/zombie/b1/footstep3.wav",
    "vj_recb/zombie/b1/footstep4.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoices()
      local voice = math.random(1,6)
      if voice == 1 then
        self.SoundTbl_Idle = {"vj_recb/zombie/b1/male/male1/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/b1/male/male1/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/b1/male/male1/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/b1/male/male1/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/b1/male/male1/zom_die.wav"}

      elseif voice == 2 then
        self.SoundTbl_Idle = {"vj_recb/zombie/b1/male/male2/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/b1/male/male2/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/b1/male/male2/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/b1/male/male2/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/b1/male/male2/zom_die.wav"}

      elseif voice == 3 then
        self.SoundTbl_Idle = {"vj_recb/zombie/b1/male/male3/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/b1/male/male3/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/b1/male/male3/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/b1/male/male3/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/b1/male/male3/zom_die.wav"}

      elseif voice == 4 then
        self.SoundTbl_Idle = {"vj_recb/zombie/b1/male/male4/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/b1/male/male4/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/b1/male/male4/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/b1/male/male4/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/b1/male/male4/zom_die.wav"}

      elseif voice == 5 then
        self.SoundTbl_Idle = {"vj_recb/zombie/b1/male/male5/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/b1/male/male5/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/b1/male/male5/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/b1/male/male5/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/b1/male/male5/zom_die.wav"}

      elseif voice == 6 then
        self.SoundTbl_Idle = {"vj_recb/zombie/b1/male/male6/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/b1/male/male6/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/b1/male/male6/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/b1/male/male6/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/b1/male/male6/zom_die.wav"}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)
    self.AnimTbl_MeleeAttack = "attack2"
    self.MeleeAttackDamageType = DMG_SLASH
    self.MeleeAttackDamage = 25
    self.HasMeleeAttackKnockBack = true
    self.SlowPlayerOnMeleeAttack = true
    self.SoundTbl_MeleeAttackExtra = {"vj_recb/zombie/bite1.wav","vj_recb/zombie/bite2.wav"}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_Miss()
    self.AttackAnimTime = 0
    self:StopAttacks(false)
    self.vACT_StopAttacks = false
    self:PlayAnim("flinch",true,false,false)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status) return end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_Miss()
    self.AttackAnimTime = 0
    self:StopAttacks(false)
    self.vACT_StopAttacks = false
    self:PlayAnim("flinch",true,false,false)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status) return end
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