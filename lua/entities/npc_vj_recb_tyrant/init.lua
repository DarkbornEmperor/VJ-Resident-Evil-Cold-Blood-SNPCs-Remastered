AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/tyrant_103.mdl"} 
ENT.StartHealth = 2000
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
//ENT.PoseParameterLooking_Names = {pitch={}, yaw={"head"}, roll={}}
ENT.HasMeleeAttack = true 
ENT.MeleeAttackDamage = 35
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 80
ENT.TimeUntilMeleeAttackDamage = false
ENT.NextMeleeAttackTime = 1.8
ENT.HasMeleeAttackKnockBack = true 
ENT.MeleeAttackKnockBack_Forward1 = 150
ENT.MeleeAttackKnockBack_Forward2 = 150 
ENT.MeleeAttackKnockBack_Up1 = 60
ENT.MeleeAttackKnockBack_Up2 = 60 
ENT.SlowPlayerOnMeleeAttack = true
ENT.HasMeleeAttackSlowPlayerSound = false
ENT.SlowPlayerOnMeleeAttack_WalkSpeed = 100 
ENT.SlowPlayerOnMeleeAttack_RunSpeed = 100 
ENT.SlowPlayerOnMeleeAttackTime = 0.8
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 10
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(20, 25, -60), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_recb/tyrant103/ty_walk.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"vj_recb/tyrant103/ty_punch.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_recb/tyrant103/ty_swing.wav"}
ENT.SoundTbl_Impact = {"vj_recb/shared/hit_flesh1.wav","vj_recb/shared/hit_flesh2.wav","vj_recb/shared/hit_flesh3.wav","vj_recb/shared/hit_flesh4.wav"}
ENT.SoundTbl_SoundTrack = {"vj_recb/tyrant103/recb_-_tyrant.wav"}
ENT.HasSoundTrack = true
ENT.SoundTrackLevel = 0.8

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
	if key == "death" then
		VJ_EmitSound(self, "vj_recb/tyrant103/ty_bodydrop.wav", 75, 100)
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
if GetConVar("VJ_RECB_BossMusic"):GetInt() == 0 then
        self.HasSoundTrack = false 
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize() 
	self:SetCollisionBounds(Vector(18, 18, 90), Vector(-18, -18, 0))	
end   	
 ---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    if (dmginfo:IsBulletDamage()) && hitgroup != HITGROUP_HEAD then
	    dmginfo:ScaleDamage(0.05)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/