AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/recb_zombie_female.mdl"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoices()
local voice = math.random(1,2)

if voice == 1 then
self.SoundTbl_Idle = {"vj_recb/zombie/female/female1/zof_idle.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/female/female1/zof_idle.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/female/female1/zof_attack.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/female/female1/zof_pain.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/female/female1/zof_die.wav"}

elseif voice == 2 then
self.SoundTbl_Idle = {"vj_recb/zombie/female/female2/zof_idle.wav"}
self.SoundTbl_Alert = {"vj_recb/zombie/female/female2/zof_idle.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_recb/zombie/female/female2/zof_attack.wav"}
self.SoundTbl_Pain = {"vj_recb/zombie/female/female2/zof_pain.wav"}
self.SoundTbl_Death = {"vj_recb/zombie/female/female2/zof_die.wav"}
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
		local attacker = dmginfo:GetAttacker()	
		if self.RArm_Damaged == false && math.random(1,10) == 1 && hitgroup == HITGROUP_RIGHTARM then
		self.RArm_Damaged = true 
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("rarm")).Pos,self:GetAngles())
		self:EmitSound(Sound("vj_recb/zombie/zom_armlost.wav",70))
		self:SetBodygroup(4,1)
		
		elseif self.LArm_Damaged == false && math.random(1,10) == 1 && hitgroup == HITGROUP_LEFTARM then
		self.LArm_Damaged = true 
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("larm")).Pos,self:GetAngles())
		self:EmitSound(Sound("vj_recb/zombie/zom_armlost.wav",70))
		self:SetBodygroup(5,1)
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
				    ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("rleg")).Pos,self:GetAngles())
					self:SetBodygroup(3,1)
				elseif hitgroup == HITGROUP_RIGHTLEG then
				    ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("lleg")).Pos,self:GetAngles())
					self:SetBodygroup(2,1)
end
				if math.random(1,4) == 1 then anim = ACT_FLINCH_PHYSICS end
				self:VJ_ACT_PLAYACTIVITY(anim,true,false,true)
				self:EmitSound(Sound("vj_recb/zombie/zom_leglost.wav",70))
				self:Cripple()
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 then
	    self:EmitSound(Sound("vj_recb/zombie/zom_headburst.wav",70))
		self:SetBodygroup(1,1)
	
		if self.HasGibDeathParticles == true then
			for i=1,3 do
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
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/