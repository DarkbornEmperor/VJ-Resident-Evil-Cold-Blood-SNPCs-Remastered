AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/zombie_researcher.mdl"} 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,3))	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_OnBleed(dmginfo,hitgroup)
    if GetConVar("VJ_RECB_Dismember"):GetInt() == 0 then return end
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
				self:SetBodygroup(0,0)
				self:VJ_ACT_PLAYACTIVITY(anim,true,false,false)
				VJ_EmitSound(self,"vj_recb/zombie/zom_leglost.wav",75,100)
		        self:RemoveAllDecals()
				self:Cripple()
		end
	end
end
	 local chest = {2} -- Chest
	 local rarm = {5} -- Right Arm
	 local larm = {4} -- Left Arm
	 if VJ_HasValue(chest,hitgroup) then
		self.ChestHealth = self.ChestHealth -dmginfo:GetDamage()		
	 if !self.Chest_Damaged && hitgroup == HITGROUP_CHEST && self.ChestHealth <= 0 then
		self.Chest_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("chest")).Pos,self:GetAngles())
		VJ_EmitSound(self,"vj_recb/zombie/zom_armlost.wav",75,100)
		self:SetBodygroup(0,0)
		self:SetBodygroup(4,1)
		self:RemoveAllDecals()
	end
end
	 if VJ_HasValue(rarm,hitgroup) then
		self.RArmHealth = self.RArmHealth -dmginfo:GetDamage()	
	 if !self.RArm_Damaged && hitgroup == HITGROUP_RIGHTARM && self.RArmHealth <= 0 then
		self.RArm_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("rarm")).Pos,self:GetAngles())
		VJ_EmitSound(self,"vj_recb/zombie/zom_armlost.wav",75,100)
		self:SetBodygroup(0,0)
		self:SetBodygroup(5,1)
		self:RemoveAllDecals()
	end
end
	 if VJ_HasValue(larm,hitgroup) then
		self.LArmHealth = self.LArmHealth -dmginfo:GetDamage()	
	 if !self.LArm_Damaged && hitgroup == HITGROUP_LEFTARM && self.LArmHealth <= 0 then
		self.LArm_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("larm")).Pos,self:GetAngles())
		VJ_EmitSound(self,"vj_recb/zombie/zom_armlost.wav",75,100)
		self:SetBodygroup(0,0)
		self:SetBodygroup(6,1)
		self:RemoveAllDecals()
		end
	end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    if GetConVar("VJ_RECB_Gib"):GetInt() == 0 then return end
	if dmginfo:GetDamageForce():Length() < 800 then return end
	if hitgroup == HITGROUP_HEAD then
	    VJ_EmitSound(self,"vj_recb/zombie/zom_headburst.wav",75,100)
		self:SetBodygroup(1,1)
        self.HasDeathSounds = false
		self:RemoveAllDecals()
	
	 if self.HasGibDeathParticles then
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
				
		local BloodEffect = ents.Create("info_particle_system")
		BloodEffect:SetKeyValue("effect_name","blood_advisor_pierce_spray")
		BloodEffect:SetPos(self:GetAttachment(self:LookupAttachment("head")).Pos)
		BloodEffect:SetAngles(self:GetAttachment(self:LookupAttachment("head")).Ang)
		BloodEffect:SetParent(self)
		BloodEffect:Fire("SetParentAttachment","head")
		BloodEffect:Spawn()
		BloodEffect:Activate()
		BloodEffect:Fire("Start","",0)
		BloodEffect:Fire("Kill","",5)					
        end
    end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/