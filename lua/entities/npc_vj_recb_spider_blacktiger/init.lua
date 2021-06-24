AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/recb_black_tiger.mdl"} 
ENT.StartHealth = 1500
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.VJ_IsHugeMonster = true
ENT.Immune_Physics = true
ENT.BloodColor = "Yellow"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact_green"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Yellow"}
ENT.HullType = HULL_LARGE
ENT.CanFlinch = 1
ENT.FlinchChance = 5
ENT.AnimTbl_Flinch = {ACT_FLINCH_PHYSICS}
ENT.HasMeleeAttack = true 
ENT.NextMeleeAttackTime = 1.8
ENT.MeleeAttackDamageType = DMG_POISON
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 25
ENT.MeleeAttackDistance = 50 
ENT.MeleeAttackDamageDistance = 150
ENT.SlowPlayerOnMeleeAttack = true
ENT.SlowPlayerOnMeleeAttack_WalkSpeed = 100 
ENT.SlowPlayerOnMeleeAttack_RunSpeed = 100 
ENT.SlowPlayerOnMeleeAttackTime = 0.8
ENT.HasRangeAttack = true 
ENT.AnimTbl_RangeAttack = {ACT_RANGE_ATTACK1}
ENT.RangeAttackEntityToSpawn = "obj_vj_recb_spider_spit"
ENT.NextRangeAttackTime = 6
ENT.RangeDistance = 700
ENT.RangeToMeleeDistance = 200
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.RangeUseAttachmentForPos = true 
ENT.RangeUseAttachmentForPosID = "mouth"
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 
ENT.GibOnDeathDamagesTable = {"All"}
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(-40, 25, -25), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_recb/spider/fl_walk.wav"}
ENT.SoundTbl_Idle = {"vj_recb/spider/fl_out.wav"} 
ENT.SoundTbl_Alert = {"vj_recb/spider/fl_out.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_recb/spider/spider_bite.wav","vj_recb/spider/spider_bite2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_recb/shared/claw_miss1.wav","vj_recb/shared/claw_miss2.wav"}
ENT.SoundTbl_RangeAttack = {"vj_recb/spider/Sp_spit.wav"}
ENT.SoundTbl_Pain = {"vj_recb/spider/fl_dam.wav"}
ENT.SoundTbl_Death = {"vj_recb/ant/ant_die.wav"}
ENT.SoundTbl_Impact = {"vj_recb/shared/hit_flesh1.wav","vj_recb/shared/hit_flesh2.wav","vj_recb/shared/hit_flesh3.wav","vj_recb/shared/hit_flesh4.wav"}
ENT.SoundTbl_SoundTrack = {"vj_recb/mapspawner/spidersrevenge.wav"}
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
	if key == "range_attack" then
		self:RangeAttackCode()
end
	if key == "death" then
		VJ_EmitSound(self, "vj_recb/spider/sp_bodyfall.wav", 85, 100)
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
if GetConVarNumber("VJ_RECB_Gibbing") == 0 then
        self.AllowedToGib = false 
        self.HasGibOnDeath = false 
        self.HasGibOnDeathSounds = false 
        self.HasGibDeathParticles = false
end

if GetConVarNumber("VJ_RECB_Boss_Music") == 0 then
        self.HasSoundTrack = false 
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize() 
	self:SetCollisionBounds(Vector(80, 80, 75), Vector(-60, -70, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1500)
end
 ---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    if (dmginfo:IsBulletDamage()) then
	    dmginfo:ScaleDamage(0.25)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	if hitgroup == 1 && dmginfo:GetDamageForce():Length() > 800 then
	    self:EmitSound(Sound("vj_recb/spider/sp_abdomenlost.wav",70))
		self:SetBodygroup(0,1)
	
		if self.HasGibDeathParticles == true then
			for i=1,3 do
				ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("abdomen")).Pos,self:GetAngles())
			
		local bloodeffect = ents.Create("info_particle_system")
		bloodeffect:SetKeyValue("effect_name","blood_advisor_pierce_spray")
		bloodeffect:SetPos(self:GetAttachment(self:LookupAttachment("abdomen")).Pos)
		bloodeffect:SetAngles(self:GetAttachment(self:LookupAttachment("abdomen")).Ang)
		bloodeffect:SetParent(self)
		bloodeffect:Fire("SetParentAttachment","abdomen")
		bloodeffect:Spawn()
		bloodeffect:Activate()
		bloodeffect:Fire("Start","",0)
		bloodeffect:Fire("Kill","",2)	
				
	end
end
		return true,{DeathAnim=true}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
		self.AnimTbl_Death = {ACT_DIESIMPLE}
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/