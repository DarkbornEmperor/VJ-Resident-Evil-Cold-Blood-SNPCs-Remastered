AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b2/zombie_torso.mdl"
ENT.StartHealth = 250
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_recb_blood_red"}
ENT.BloodDecal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 25
ENT.MeleeAttackDistance = 20
ENT.MeleeAttackDamageDistance = 40
ENT.SlowPlayerOnMeleeAttack = true
ENT.HasMeleeAttackSlowPlayerSound = false
ENT.SlowPlayerOnMeleeAttack_WalkSpeed = 0.01
ENT.SlowPlayerOnMeleeAttack_RunSpeed = 0.01
ENT.SlowPlayerOnMeleeAttackTime = 1.7
ENT.HasMeleeAttackKnockBack = true
ENT.MeleeAttackKnockBack_Forward1 = -100
ENT.MeleeAttackKnockBack_Forward2 = -100
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
    ThirdP_Offset = Vector(35, 25, -15),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(10, 0, -30),
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:FootStepSoundCode()
    elseif key == "melee" then
        self:MeleeAttackCode()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:ZombieVoices()
    self:Zombie_Init()
    self:SetCollisionBounds(Vector(13,13,25),Vector(-13,-13,0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Init()
 local zombieSkin = math.random(1,2)
 if zombieSkin == 1 then
    self:SetSkin(math.random(0,3))
    self:SetBodygroup(0,math.random(0,1))
 elseif zombieSkin == 2 && math.random(1,3) == 1 then
    self:SetSkin(math.random(4,5))
    self:SetBodygroup(7,math.random(0,1))
end
    self.SoundTbl_FootStep = {
    "vj_recb/zombie/zom_crawl_leftarm.wav",
    "vj_recb/zombie/zom_crawl_rightarm.wav"
}
    self.SoundTbl_MeleeAttackExtra = {
    "vj_recb/zombie/bite1.wav",
    "vj_recb/zombie/bite2.wav"
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
      local voice = math.random(1,11)
      if voice == 1 then
        self.SoundTbl_Idle = {"vj_recb/zombie/male/male1/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/male/male1/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male1/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/male/male1/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/male/male1/zom_die.wav"}

      elseif voice == 2 then
        self.SoundTbl_Idle = {"vj_recb/zombie/male/male2/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/male/male2/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male2/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/male/male2/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/male/male2/zom_die.wav"}

      elseif voice == 3 then
        self.SoundTbl_Idle = {"vj_recb/zombie/male/male3/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/male/male3/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male3/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/male/male3/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/male/male3/zom_die.wav"}

      elseif voice == 4 then
        self.SoundTbl_Idle = {"vj_recb/zombie/male/male4/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/male/male4/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male4/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/male/male4/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/male/male4/zom_die.wav"}

      elseif voice == 5 then
        self.SoundTbl_Idle = {"vj_recb/zombie/male/male5/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/male/male5/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male5/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/male/male5/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/male/male5/zom_die.wav"}

      elseif voice == 6 then
        self.SoundTbl_Idle = {"vj_recb/zombie/male/male6/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/male/male6/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male6/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/male/male6/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/male/male6/zom_die.wav"}

      elseif voice == 7 then
        self.SoundTbl_Idle = {"vj_recb/zombie/male/male7/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/male/male7/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male7/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/male/male7/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/male/male7/zom_die.wav"}

      elseif voice == 8 then
        self.SoundTbl_Idle = {"vj_recb/zombie/male/male8/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/male/male8/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male8/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/male/male8/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/male/male8/zom_die.wav"}

      elseif voice == 9 then
        self.SoundTbl_Idle = {"vj_recb/zombie/male/male9/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/male/male9/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male9/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/male/male9/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/male/male9/zom_die.wav"}

      elseif voice == 10 then
        self.SoundTbl_Idle = {"vj_recb/zombie/male/male10/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/male/male10/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male10/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/male/male10/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/male/male10/zom_die.wav"}

      elseif voice == 11 then
        self.SoundTbl_Idle = {"vj_recb/zombie/male/male11/zom_idle.wav"}
        self.SoundTbl_Alert = {"vj_recb/zombie/male/male11/zom_idle.wav"}
        self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male11/zom_attack.wav"}
        self.SoundTbl_Pain = {"vj_recb/zombie/male/male11/zom_pain.wav"}
        self.SoundTbl_Death = {"vj_recb/zombie/male/male11/zom_die.wav"}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local vecZ50 = Vector(0, 0, -50)
--
function ENT:OnThinkActive()
    if self:IsMoving() && CurTime() > self.WeirdCrawl_NextBloodT then
        local selfPos = self:GetPos() + self:OBBCenter()
        local tr = util.TraceLine({start = selfPos, endpos = selfPos + vecZ50, filter = self})
        util.Decal("VJ_RECB_Blood_Red", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal, self)
	      self.WeirdCrawl_NextBloodT = CurTime() + 1
	  end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_Miss()
    self.AttackAnimTime = 0
    self:StopAttacks(false)
    self.vACT_StopAttacks = false
    self:PlayAnim("lunge",true,false,false)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
    if status == "Initial" then
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