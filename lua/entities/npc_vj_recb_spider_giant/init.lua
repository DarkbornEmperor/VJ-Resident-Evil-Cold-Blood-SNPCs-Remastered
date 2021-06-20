AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/recb/recb_giantspider.mdl"} 
ENT.StartHealth = 300
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Yellow"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact_green"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Yellow"}
ENT.HullType = HULL_LARGE
ENT.CanFlinch = 1
ENT.FlinchChance = 5
ENT.AnimTbl_Flinch = {ACT_FLINCH_PHYSICS}
ENT.HasMeleeAttack = true 
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 10
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 90
ENT.HasRangeAttack = true 
ENT.AnimTbl_RangeAttack = {ACT_RANGE_ATTACK1}
ENT.RangeAttackEntityToSpawn = "obj_vj_recb_spider_spit"
ENT.RangeDistance = 2000
ENT.RangeToMeleeDistance = 500
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.RangeUseAttachmentForPos = true 
ENT.RangeUseAttachmentForPosID = "mouth"
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 
ENT.GibOnDeathDamagesTable = {"All"}

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_MeleeAttack = {"spider/spider_bite.wav","spider/spider_bite2.wav"}
ENT.SoundTbl_RangeAttack = {"spider/Sp_spit.wav"}
ENT.SoundTbl_Impact = {"shared/hit_flesh1.wav","shared/hit_flesh2.wav","shared/hit_flesh3.wav","shared/hit_flesh4.wav"}

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
		VJ_EmitSound(self, "spider/sp_bodyfall.wav", 85, math.random(100,100))
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize() 
	self:SetCollisionBounds(Vector(60, 50, 52), Vector(-60, -50, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return (self:GetEnemy():GetPos() - self:LocalToWorld(Vector(80,0,0)))*2 + self:GetUp()*120
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	if hitgroup == 1 && dmginfo:GetDamageForce():Length() > 800 then
	    self:EmitSound(Sound("spider/sp_abdomenlost.wav",70))
		self:SetBodygroup(0,1)
	
		if self.HasGibDeathParticles == true then
			for i=1,3 do
				ParticleEffect("drg_re1_blood_impact_green",self:GetAttachment(self:LookupAttachment("abdomen")).Pos,self:GetAngles())
				ParticleEffect("drg_re1_blood_impact_green",self:GetAttachment(self:LookupAttachment("abdomen")).Pos,self:GetAngles())
				ParticleEffect("drg_re1_blood_impact_green",self:GetAttachment(self:LookupAttachment("abdomen")).Pos,self:GetAngles())
				
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