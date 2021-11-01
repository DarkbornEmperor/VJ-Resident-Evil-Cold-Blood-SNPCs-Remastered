AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/zombie_crimsonhead_researcher.mdl"} 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,3))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
     if GetConVarNumber("VJ_RECB_Dismember") == 0 then return end	
		if self.Chest_Damaged == false && math.random(1,10) == 1 && hitgroup == HITGROUP_CHEST then
		self.Chest_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("chest")).Pos,self:GetAngles())
		self:EmitSound(Sound("vj_recb/zombie/zom_armlost.wav",75,100))
		self:SetBodygroup(0,0)
		self:SetBodygroup(4,1)
	
		elseif self.RArm_Damaged == false && math.random(1,10) == 1 && hitgroup == HITGROUP_RIGHTARM then
		self.RArm_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("rarm")).Pos,self:GetAngles())
		self:EmitSound(Sound("vj_recb/zombie/zom_armlost.wav",75,100))
		self:SetBodygroup(0,0)
		self:SetBodygroup(5,1)

		elseif self.LArm_Damaged == false && math.random(1,10) == 1 && hitgroup == HITGROUP_LEFTARM then
		self.LArm_Damaged = true
		ParticleEffect("drg_re1_blood_impact_large",self:GetAttachment(self:LookupAttachment("larm")).Pos,self:GetAngles())
		self:EmitSound(Sound("vj_recb/zombie/zom_armlost.wav",75,100))
		self:SetBodygroup(0,0)
		self:SetBodygroup(6,1)
    end
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    if GetConVarNumber("VJ_RECB_Dismember") == 0 then return end
	if hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 then
	    self:EmitSound(Sound("vj_recb/zombie/zom_headburst.wav",75,100))
		self:SetBodygroup(1,1)
        self.HasDeathSounds = false
	
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
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/