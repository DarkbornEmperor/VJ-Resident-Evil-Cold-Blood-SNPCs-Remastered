AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/zombie_torso.mdl"} 
ENT.StartHealth = 100
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = 1
ENT.FlinchChance = 5
ENT.AnimTbl_Flinch = {ACT_FLINCH_PHYSICS}
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 10
ENT.MeleeAttackDistance = 20 
ENT.MeleeAttackDamageDistance = 40
ENT.HasMeleeAttackKnockBack = true
ENT.MeleeAttackKnockBack_Forward1 = -50
ENT.MeleeAttackKnockBack_Forward2 = -50
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 8
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(35, 25, -15), 
	FirstP_Bone = "Bip01 Head", 
	FirstP_Offset = Vector(10, 0, -30), 
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_recb/zombie/zom_crawl_leftarm.wav","vj_recb/zombie/zom_crawl_rightarm.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_recb/zombie/bite1.wav","vj_recb/zombie/bite2.wav"}
ENT.SoundTbl_Impact = {"vj_recb/shared/hit_flesh1.wav","vj_recb/shared/hit_flesh2.wav","vj_recb/shared/hit_flesh3.wav","vj_recb/shared/hit_flesh4.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
   end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:ZombieVoices()	
    self:SetCollisionBounds(Vector(16,16,20),Vector(-16,-16,0))

    local zombieskin = math.random(1,2)

    if zombieskin == 1 then
	self:SetSkin(math.random(0,3))
	self:SetBodygroup(0,math.random(0,1))

    elseif zombieskin == 2 then
	self:SetSkin(math.random(4,5))
	self:SetBodygroup(7,math.random(0,1))
   end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoices()
local voice = math.random(1,26)

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

elseif voice == 12 then
self.SoundTbl_Idle = {"vj_recb/zombie/male/male12/zom_idle.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/male/male12/zom_idle.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male12/zom_attack.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/male/male12/zom_pain.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/male/male12/zom_die.wav"}

elseif voice == 13 then
self.SoundTbl_Idle = {"vj_recb/zombie/male/male13/zom_idle.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/male/male13/zom_idle.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male13/zom_attack.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/male/male13/zom_pain.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/male/male13/zom_die.wav"}

elseif voice == 14 then
self.SoundTbl_Idle = {"vj_recb/zombie/male/male14/zom_idle.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/male/male14/zom_idle.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male14/zom_attack.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/male/male14/zom_pain.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/male/male14/zom_die.wav"}

elseif voice == 15 then
self.SoundTbl_Idle = {"vj_recb/zombie/male/male15/zom_idle.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/male/male15/zom_idle.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male15/zom_attack.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/male/male15/zom_pain.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/male/male15/zom_die.wav"}

elseif voice == 16 then
self.SoundTbl_Idle = {"vj_recb/zombie/male/male16/zom_idle.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/male/male16/zom_idle.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male16/zom_attack.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/male/male16/zom_pain.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/male/male16/zom_die.wav"}

elseif voice == 17 then
self.SoundTbl_Idle = {"vj_recb/zombie/male/male17/zom_idle.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/male/male17/zom_idle.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male17/zom_attack.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/male/male17/zom_pain.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/male/male17/zom_die.wav"}

elseif voice == 18 then
self.SoundTbl_Idle = {"vj_recb/zombie/male/male18/zom_idle.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/male/male18/zom_idle.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male18/zom_attack.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/male/male18/zom_pain.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/male/male18/zom_die.wav"}

elseif voice == 19 then
self.SoundTbl_Idle = {"vj_recb/zombie/male/male19/z_aoya02.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/male/male19/z_aoya02.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male19/z_aoya01.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/male/male19/z_aoya01.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/male/male19/z_aoya02.wav"}

elseif voice == 19 then
self.SoundTbl_Idle = {"vj_recb/zombie/male/male19/z_aoya02.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/male/male19/z_aoya02.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male19/z_aoya01.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/male/male19/z_aoya01.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/male/male19/z_aoya02.wav"}

elseif voice == 20 then
self.SoundTbl_Idle = {"vj_recb/zombie/male/male19/z_aoya21.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/male/male19/z_aoya21.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male19/z_aoya22.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/male/male19/z_aoya22.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/male/male19/z_aoya23.wav"}

elseif voice == 21 then
self.SoundTbl_Idle = {"vj_recb/zombie/male/male19/z_isi01.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/male/male19/z_isi01.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male19/z_isi202.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/male/male19/z_isi02.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/male/male19/z_isi03.wav"}

elseif voice == 22 then
self.SoundTbl_Idle = {"vj_recb/zombie/male/male19/z_isi301.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/male/male19/z_isi301.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male19/z_isi302.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/male/male19/z_isi302.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/male/male19/z_isi303.wav"}

elseif voice == 23 then
self.SoundTbl_Idle = {"vj_recb/zombie/male/male19/z_k02.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/male/male19/z_k02.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male19/z_k01.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/male/male19/z_k03.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/male/male19/z_k01.wav"}

elseif voice == 24 then
self.SoundTbl_Idle = {"vj_recb/zombie/male/male19/z_mika02.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/male/male19/z_mika02.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male19/z_mika02.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/male/male19/z_mika03.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/male/male19/z_mika01.wav"}

elseif voice == 25 then
self.SoundTbl_Idle = {"vj_recb/zombie/male/male19/z_simo02.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/male/male19/z_simo02.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male19/z_simo02.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/male/male19/z_simo01.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/male/male19/z_simo03.wav"}

elseif voice == 26 then
self.SoundTbl_Idle = {"vj_recb/zombie/male/male19/z_suzu02.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/male/male19/z_suzu02.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/male/male19/z_suzu02.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/male/male19/z_suzu03.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/male/male19/z_suzu01.wav"}
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_Miss() 
    if self.MeleeAttacking == true then
	   self.vACT_StopAttacks = true
	   self.PlayingAttackAnimation = false
       self:VJ_ACT_PLAYACTIVITY("lunge",true,false,false)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/