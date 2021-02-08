AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/recb/recb_zombie_soldier.mdl"} 
ENT.StartHealth = 250
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetSkin(math.random(0,3))
	self:SetBodygroup(1,math.random(0,4))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:IsBulletDamage())then
		local attacker = dmginfo:GetAttacker()
	
		if math.random(1,5) == 1 && hitgroup == HITGROUP_RIGHTARM then
		self:EmitSound(Sound("zombie/zom_armlost.wav",70))
		self:SetBodygroup(5,1)
end

		if math.random(1,5) == 1 && hitgroup == HITGROUP_LEFTARM then
		self:EmitSound(Sound("zombie/zom_armlost.wav",70))
		self:SetBodygroup(6,1)
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
		self:SetBodygroup(3,1)
		
		elseif hitgroup == HITGROUP_LEFTLEG then
		self:SetBodygroup(4,1)
end
end	
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 then
	    self:EmitSound(Sound("zombie/zom_headburst.wav",70))
		self:SetBodygroup(0,1)
		self:SetBodygroup(1,5)
	
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
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/