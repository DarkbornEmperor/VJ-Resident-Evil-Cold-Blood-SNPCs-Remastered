AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/recb/recb_zombie_female.mdl"}
ENT.StartHealth = 150
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","FACTION_MOLDED","FACTION_RE6_USTANAK","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = 1
ENT.FlinchChance = 5
ENT.AnimTbl_Flinch = {ACT_FLINCH_PHYSICS}
ENT.HasMeleeAttack = true 
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

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100

-- Crawling
ENT.Zombie_Crawl = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
end
	--if key == "crawl" then
		--self:FootStepSoundCode()
	--end

	if key == "death" then
		VJ_EmitSound(self, "zombie/zom_bodyfall"..math.random(1,2)..".wav", 85, math.random(100,100))
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	if math.random(1,1) == 1 then
		self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
		self.MeleeAttackDamage = 15
end
	if self.Zombie_Crawl == true then
	self.AnimTbl_MeleeAttack = {"vjseq_crawl_attack"}
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:IsBulletDamage())then
		local attacker = dmginfo:GetAttacker()
		
		if math.random(1,5) == 1 && hitgroup == HITGROUP_RIGHTARM then
		self:EmitSound(Sound("zombie/zom_armlost.wav",70))
		self:SetBodygroup(4,1)
end

		if math.random(1,5) == 1 && hitgroup == HITGROUP_LEFTARM then
		self:EmitSound(Sound("zombie/zom_armlost.wav",70))
		self:SetBodygroup(5,1)
end

		if math.random(1,5) == 1 && hitgroup == HITGROUP_RIGHTLEG or hitgroup == HITGROUP_LEFTLEG && self.Zombie_Crawl == false then
		self.Zombie_Crawl = true
		self:EmitSound(Sound("zombie/zom_leglost.wav",70))
		self:VJ_ACT_PLAYACTIVITY("legless_fall",true,0.4,true)
		self.AnimTbl_IdleStand = {self:GetSequenceActivity(self:LookupSequence("legless_idle"))}
	    self.AnimTbl_Walk = {self:GetSequenceActivity(self:LookupSequence("crawl_1","crawl_2"))}
	    self.AnimTbl_Run = {self:GetSequenceActivity(self:LookupSequence("crawl_1","crawl_2"))}
	    self.CanFlinch = 0
		self:SetCollisionBounds(Vector(35, 15, 20), -Vector(35, 15, 0))
		
		if hitgroup == HITGROUP_RIGHTLEG then
		self:SetBodygroup(2,1)
		
		elseif hitgroup == HITGROUP_LEFTLEG then
		self:SetBodygroup(3,1)
end
end	
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 then
	    self:EmitSound(Sound("zombie/zom_headburst.wav",70))
		self:SetBodygroup(1,1)
	
		if self.HasGibDeathParticles == true then
			for i=1,3 do
				ParticleEffect("blood_impact_red_01",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
				ParticleEffect("blood_impact_red_01",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
				ParticleEffect("blood_impact_red_01",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
				
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
	if hitgroup == HITGROUP_HEAD && self.Zombie_Crawl == false then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
	else
		self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE,ACT_DIE_GUTSHOT,ACT_DIEVIOLENT,ACT_CHESTSHOT}
end
	if self.Zombie_Crawl == true then
	self.AnimTbl_Death = {ACT_DIE_BACKSHOT}
end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/