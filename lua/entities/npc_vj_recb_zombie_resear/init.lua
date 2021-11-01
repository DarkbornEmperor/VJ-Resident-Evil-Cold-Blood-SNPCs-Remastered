AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/zombie_researcher.mdl"} 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,3))	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
     if GetConVarNumber("VJ_RECB_Dismember") == 0 then return end
		if self.Head_Damaged == false && math.random(1,10) == 1 && hitgroup == HITGROUP_HEAD then
		self.Head_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())	
		self:EmitSound(Sound("vj_recb/zombie/zom_neck_break.wav",75,100))	
		self:SetBodygroup(1,2)
	
		elseif self.Chest_Damaged == false && math.random(1,10) == 1 && hitgroup == HITGROUP_CHEST then
		self.Chest_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("chest")).Pos,self:GetAngles())
		self:EmitSound(Sound("vj_recb/zombie/zom_armlost.wav",75,100))
		self:SetBodygroup(4,1)

		elseif self.RArm_Damaged == false && math.random(1,10) == 1 && hitgroup == HITGROUP_RIGHTARM then
		self.RArm_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("rarm")).Pos,self:GetAngles())
		self:EmitSound(Sound("vj_recb/zombie/zom_armlost.wav",75,100))
		self:SetBodygroup(5,1)

		elseif self.LArm_Damaged == false && math.random(1,10) == 1 && hitgroup == HITGROUP_LEFTARM then
		self.LArm_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("larm")).Pos,self:GetAngles())
		self:EmitSound(Sound("vj_recb/zombie/zom_armlost.wav",75,100))
		self:SetBodygroup(6,1)
    end
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_OnBleed(dmginfo,hitgroup)
    if GetConVarNumber("VJ_RECB_Dismember") == 0 then return end
	if !self.Crippled then
		local legs = {6,7}
		if VJ_HasValue(legs,hitgroup) then
			self.LegHealth = self.LegHealth -dmginfo:GetDamage()
			if self.LegHealth <= 0 then
				self.Crippled = true
				local anim = ACT_FLINCH_PHYSICS
				if hitgroup == HITGROUP_LEFTLEG then
				    ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("lleg")).Pos,self:GetAngles())
					self:SetBodygroup(3,1)
				elseif hitgroup == HITGROUP_RIGHTLEG then
				    ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("rleg")).Pos,self:GetAngles())
					self:SetBodygroup(2,1)
end
				if math.random(1,4) == 1 then anim = ACT_FLINCH_PHYSICS end
				self:VJ_ACT_PLAYACTIVITY(anim,true,false,true)
				self:EmitSound(Sound("vj_recb/zombie/zom_leglost.wav",70,100))
				self:Cripple()
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    if GetConVarNumber("VJ_RECB_Dismember") == 0 then return end
	if hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 then
	    self:EmitSound(Sound("vj_recb/zombie/zom_headburst.wav",70,100))
		self:SetBodygroup(1,3)
        self.HasDeathSounds = false
	
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
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/