AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/babyspider.mdl"} 
ENT.StartHealth = 5
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Yellow"
ENT.CanOpenDoors = false 
ENT.Behavior = VJ_BEHAVIOR_PASSIVE_NATURE 
ENT.CustomBlood_Particle = {"drg_re1_blood_impact_green"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Yellow"}
ENT.HullType = HULL_TINY
ENT.HasMeleeAttack = false 
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(40, 20, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Joint 18", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Impact = {"vj_recb/shared/hit_flesh1.wav","vj_recb/shared/hit_flesh2.wav","vj_recb/shared/hit_flesh3.wav","vj_recb/shared/hit_flesh4.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize() 
	self:SetCollisionBounds(Vector(2, 2, 2), Vector(-2, -2, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTouch(ent)
	if ent:IsPlayer() or ent:IsNPC() then
		self:TakeDamage(self:Health() + 1, ent, ent)
		VJ_EmitSound(self, "vj_recb/spider/mini_spider_crush.wav", 75, 100)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/