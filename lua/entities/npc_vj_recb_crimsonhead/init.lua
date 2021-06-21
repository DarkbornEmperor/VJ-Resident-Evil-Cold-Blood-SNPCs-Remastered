AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/recb/recb_zombie_crimsonhead.mdl"} 
ENT.StartHealth = 200
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = 1
ENT.FlinchChance = 8
ENT.AnimTbl_Flinch = {ACT_FLINCH_PHYSICS}
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 20
ENT.NextMeleeAttackTime = 1.5
ENT.MeleeAttackDistance = 25 
ENT.MeleeAttackDamageDistance = 55
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 
ENT.GibOnDeathDamagesTable = {"All"}

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"zombie/footstep1.wav","zombie/footstep2.wav","zombie/footstep3.wav"}
ENT.SoundTbl_Breath = {"zombie/crimsonhead/crimhead_run.wav"}
ENT.SoundTbl_Idle = {"zombie/CrimsonHead/crimhead_attack1.wav","zombie/CrimsonHead/crimhead_attack2.wav"}
ENT.SoundTbl_Alert = {"zombie/CrimsonHead/crimhead_alert.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"zombie/CrimsonHead/crimhead_attack1.wav","zombie/CrimsonHead/crimhead_attack2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav","npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_Pain = {"zombie/CrimsonHead/crimhead_pain.wav"}
ENT.SoundTbl_Death = {"zombie/CrimsonHead/crimhead_die.wav"}
ENT.SoundTbl_MeleeAttack = {"zombie/CrimsonHead/crimhead_slash.wav"}
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
	if key == "death" then
		VJ_EmitSound(self, "zombie/zom_bodyfall"..math.random(1,2)..".wav", 85, 100)
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
local zombieskin = math.random(1,2)

    if zombieskin == 1 then
	self:SetSkin(math.random(0,3))

    elseif zombieskin == 2 then
	self:SetSkin(math.random(4,5))
	self:SetBodygroup(7,math.random(0,1))
   end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	if (dmginfo:IsBulletDamage()) && self.Damaged == false then
		local attacker = dmginfo:GetAttacker()
	
		if math.random(1,10) == 1 && hitgroup == HITGROUP_HEAD then
		self:EmitSound(Sound("zombie/zom_neck_break.wav",70))
		self:SetBodygroup(1,2)
		self:SetBodygroup(7,0)
		self.Damaged = true
end	
	
		if math.random(1,10) == 1 && hitgroup == HITGROUP_CHEST then
		self:EmitSound(Sound("zombie/zom_armlost.wav",70))
		self:SetBodygroup(4,1)
		self.Damaged = true
end		
		if math.random(1,10) == 1 && hitgroup == HITGROUP_RIGHTARM then
		self:EmitSound(Sound("zombie/zom_armlost.wav",70))
		self:SetBodygroup(5,1)
		self.Damaged = true
end

		if math.random(1,10) == 1 && hitgroup == HITGROUP_LEFTARM then
		self:EmitSound(Sound("zombie/zom_armlost.wav",70))
		self:SetBodygroup(6,1)
		self.Damaged = true
      end
   end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 then
	    self:EmitSound(Sound("zombie/zom_headburst.wav",70))
		self:SetBodygroup(1,3)
		self:SetBodygroup(7,0)
	
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
		self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE,ACT_DIE_GUTSHOT,ACT_DIEVIOLENT,ACT_CHESTSHOT}
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