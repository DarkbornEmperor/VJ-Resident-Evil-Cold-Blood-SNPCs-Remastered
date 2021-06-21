AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/recb/recb_zombie_female.mdl"}
ENT.StartHealth = 150
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = 1
ENT.FlinchChance = 5
ENT.AnimTbl_Flinch = {ACT_FLINCH_CHEST}
ENT.HasMeleeAttack = true 
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
ENT.MeleeAttackDamage = 15
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 20 
ENT.MeleeAttackDamageDistance = 50
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 
ENT.GibOnDeathDamagesTable = {"All"}

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"zombie/footstep1.wav","zombie/footstep2.wav","zombie/footstep3.wav"}
ENT.SoundTbl_Idle = {"zombie/female/female1/zof_idle.wav","zombie/female/female2/zof_idle.wav"}
ENT.SoundTbl_Alert = {"zombie/female/female1/zof_idle.wav","zombie/female/female2/zof_idle.wav"}
ENT.SoundTbl_Pain = {"zombie/female/female1/zof_pain.wav","zombie/female/female2/zof_pain.wav"}
ENT.SoundTbl_Death = {"zombie/female/female1/zof_die.wav","zombie/female/female2/zof_die.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"zombie/female/female1/zof_attack.wav","zombie/female/female2/zof_attack.wav"}
ENT.SoundTbl_MeleeAttack = {"zombie/bite1.wav","zombie/bite2.wav"}
ENT.SoundTbl_Impact = {"shared/hit_flesh1.wav","shared/hit_flesh2.wav","shared/hit_flesh3.wav","shared/hit_flesh4.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100

-- Custom
ENT.LegHealth = 20
ENT.Crippled = false
ENT.Vomit_Zombie = false
ENT.Damaged = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
end
	if key == "vomit" then
		self:RangeAttackCode()
end
	if key == "death" then
		VJ_EmitSound(self, "zombie/zom_bodyfall"..math.random(1,2)..".wav", 85, 100)
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
		if math.random(1,10) == 1 then
			self.Vomit_Zombie = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if self.Vomit_Zombie && !self.Crippled then
	     self:SetVomitZombie()
   end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetVomitZombie()
    self.HasMeleeAttack = false 
	self.HasRangeAttack = true 
	self.AnimTbl_RangeAttack = {ACT_SPECIAL_ATTACK1}
	self.RangeAttackEntityToSpawn = "obj_vj_recb_zombie_vomit"
	self.RangeDistance = 60
    self.RangeToMeleeDistance = 1 
	self.TimeUntilRangeAttackProjectileRelease = false
	self.RangeUseAttachmentForPos = true 
    self.RangeUseAttachmentForPosID = "mouth"
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	if (dmginfo:IsBulletDamage()) && self.Damaged == false then
		local attacker = dmginfo:GetAttacker()
		
		if math.random(1,10) == 1 && hitgroup == HITGROUP_RIGHTARM then
		self:EmitSound(Sound("zombie/zom_armlost.wav",70))
		self:SetBodygroup(4,1)
		self.Damaged = true
end
		if math.random(1,10) == 1 && hitgroup == HITGROUP_LEFTARM then
		self:EmitSound(Sound("zombie/zom_armlost.wav",70))
		self:SetBodygroup(5,1)
		self.Damaged = true
    end
  end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_OnBleed(dmginfo,hitgroup)
	if !self.Crippled then
		local legs = {6,7}
		if VJ_HasValue(legs,hitgroup) then
			self.LegHealth = self.LegHealth -dmginfo:GetDamage()
			if self.LegHealth <= 0 then
				self.Crippled = true
				local anim = ACT_FLINCH_PHYSICS
				if hitgroup == HITGROUP_LEFTLEG then
					self:SetBodygroup(3,1)
				elseif hitgroup == HITGROUP_RIGHTLEG then
					self:SetBodygroup(2,1)
				end
				if math.random(1,4) == 1 then anim = ACT_FLINCH_PHYSICS end
				self:VJ_ACT_PLAYACTIVITY(anim,true,false,true)
				self:EmitSound(Sound("zombie/zom_leglost.wav",70))
				self:Cripple()
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Cripple()
	self:SetHullType(HULL_TINY)
	self:SetCollisionBounds(Vector(16,16,20),Vector(-16,-16,0))
	self.AnimTbl_IdleStand = {ACT_IDLE_STIMULATED}
	self.AnimTbl_Walk = {ACT_WALK_STIMULATED}
	self.AnimTbl_Run = {ACT_WALK_STIMULATED}
	self.MeleeAttackDamage = self.MeleeAttackDamage /2
	self.MaxJumpLegalDistance = VJ_Set(0,0)
	self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2}
	self:CapabilitiesRemove(bit.bor(CAP_MOVE_JUMP))
	self:CapabilitiesRemove(bit.bor(CAP_MOVE_CLIMB))	
	self.CanFlinch = 0
	self.HasRangeAttack = false
	self.HasMeleeAttack = true 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 then
	    self:EmitSound(Sound("zombie/zom_headburst.wav",70))
		self:SetBodygroup(1,1)
	
		if self.HasGibDeathParticles == true then
			for i=1,3 do
				ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
				ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
				ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
				
		local bloodeffect = ents.Create("info_particle_system")
		bloodeffect:SetKeyValue("effect_name","blood_advisor_pierce_spray")
		bloodeffect:SetPos(self:GetAttachment(self:LookupAttachment("head")).Pos)
		bloodeffect:SetAngles(self:GetAttachment(self:LookupAttachment("head")).Ang)
		bloodeffect:SetParent(self)
		bloodeffect:Fire("SetParentAttachment","head")
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
	if hitgroup == HITGROUP_HEAD && !self.Crippled then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
	else
		self.AnimTbl_Death = {ACT_DIEFORWARD,ACT_DIESIMPLE}
end
	if self.Crippled == true then
	self.AnimTbl_Death = {ACT_DIE_BACKSHOT}
end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/