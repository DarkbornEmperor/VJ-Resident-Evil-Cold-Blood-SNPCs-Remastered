include("entities/npc_vj_recb_zombie_torso/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b1/zombie_torso.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Init()
    self:SetSkin(math.random(0,5))
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
function ENT:CustomOnMeleeAttack_Miss()
    self.CurrentAttackAnimationTime = 0
    self:StopAttacks(false)
    self.vACT_StopAttacks = false
    self:VJ_ACT_PLAYACTIVITY("flinch",true,false,false)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/