AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/prototyrant.mdl"} 
ENT.StartHealth = 3000
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.FootStepTimeRun = 0.27
ENT.FootStepTimeWalk = 0.6
ENT.NextMeleeAttackTime = 1.8
ENT.HasMeleeAttackKnockBack = true 
ENT.MeleeAttackKnockBack_Forward1 = 150
ENT.MeleeAttackKnockBack_Forward2 = 150 
ENT.MeleeAttackKnockBack_Up1 = 60
ENT.MeleeAttackKnockBack_Up2 = 60 
ENT.SlowPlayerOnMeleeAttack = true
ENT.SlowPlayerOnMeleeAttack_WalkSpeed = 100 
ENT.SlowPlayerOnMeleeAttack_RunSpeed = 100 
ENT.SlowPlayerOnMeleeAttackTime = 0.8
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.AnimTbl_Death = {ACT_DIEVIOLENT}
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(20, 25, -70), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_recb/tyrant/tyrant_foot.wav"}
ENT.SoundTbl_Alert = {"vj_recb/tyrant/tyrant_roar.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_recb/tyrant/tyrant_swing2.wav","vj_recb/tyrant/tyrant_swing.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"vj_recb/tyrant/tyrant_stab.wav","vj_recb/tyrant/tyrant_slash.wav"}
ENT.SoundTbl_Impact = {"vj_recb/shared/hit_flesh1.wav","vj_recb/shared/hit_flesh2.wav","vj_recb/shared/hit_flesh3.wav","vj_recb/shared/hit_flesh4.wav"}
ENT.SoundTbl_SoundTrack = {"vj_recb/mapspawner/mansionbossend.wav"}
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
		VJ_EmitSound(self, "vj_recb/tyrant/tyrant_bodyhit.wav", 75, 100)
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
if GetConVarNumber("VJ_RECB_Boss_Music") == 0 then
        self.HasSoundTrack = false 
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize() 
	    self:SetCollisionBounds(Vector(20, 20, 100), Vector(-20, -20, 0))		
end
---------------------------------------------------------------------------------------------------------------------------------------------	
function ENT:MultipleMeleeAttacks()
	local tyrant_attack = math.random(1,2)
	if tyrant_attack == 1 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack1"}
		self.MeleeAttackDamage = 45
		self.MeleeAttackDistance = 35
		self.MeleeAttackDamageDistance = 75
		
	elseif tyrant_attack == 2 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack2"}
		self.MeleeAttackDamage = 45
		self.MeleeAttackDistance = 30
		self.MeleeAttackDamageDistance = 60
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
   if self:GetEnemy() != nil && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 200 then
      self.AnimTbl_Walk = {ACT_WALK} 
      self.AnimTbl_Run = {ACT_WALK}
  else
      self.AnimTbl_Walk = {ACT_WALK} 
      self.AnimTbl_Run = {ACT_RUN}
   end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
if math.random(1,2) == 1 && self.Tyrant_Rage == true then
        self:VJ_ACT_PLAYACTIVITY("vjseq_attack2",true,1,false)	
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	    dmginfo:ScaleDamage(0.25)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/