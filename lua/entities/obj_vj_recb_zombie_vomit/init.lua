AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/spitball_medium.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.DecalTbl_DeathDecals = {"VJ_RECB_Spit"}
--ENT.SoundTbl_Idle = {"vj_acid/acid_idle1.wav"}
ENT.SoundTbl_OnCollide = {"vj_recb/zombie/vomit_floor.wav"}
ENT.DoesRadiusDamage = true -- Should it do a blast damage when it hits something?
ENT.RadiusDamageRadius = 30 -- How far the damage go? The farther away it's from its enemy, the less damage it will do | Counted in world units
ENT.RadiusDamage = 15 -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
ENT.RadiusDamageUseRealisticRadius = true -- Should the damage decrease the farther away the enemy is from the position that the projectile hit?
ENT.RadiusDamageType = DMG_ACID-- Damage type
ENT.DoesDirectDamage = false -- Should it do a direct damage when it hits something?
ENT.DirectDamage = 15 -- How much damage should it do when it hits something
ENT.DirectDamageType = DMG_ACID -- Damage type
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:EnableGravity(true)
	phys:EnableDrag(false)
	phys:SetBuoyancyRatio(0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	ParticleEffectAttach("drg_re1_blood_impact_acid", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	self:SetNoDraw(true)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	ParticleEffectAttach("drg_re1_blood_impact_acid", PATTACH_ABSORIGIN_FOLLOW, self, 0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects(data,phys)
	ParticleEffect("drg_re1_blood_impact_acid", data.HitPos, Angle(0,0,0), nil)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/