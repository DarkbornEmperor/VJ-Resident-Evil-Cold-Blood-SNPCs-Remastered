AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/recb_hunter.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 300
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = 1
ENT.FlinchChance = 5
ENT.AnimTbl_Flinch = {ACT_FLINCH_PHYSICS}
ENT.HasHitGroupFlinching = true 
ENT.HitGroupFlinching_DefaultWhenNotHit = true
ENT.HitGroupFlinching_Values = {{HitGroup = {HITGROUP_LEFTARM}, Animation = {"vjseq_laflinch"}}, {HitGroup = {HITGROUP_RIGHTARM}, Animation = {"vjseq_raflinch"}}, {HitGroup = {HITGROUP_LEFTLEG}, Animation = {"vjseq_llflinch"}}, {HitGroup = {HITGROUP_RIGHTLEG}, Animation = {"vjseq_rlflinch"}}}
ENT.HasMeleeAttack = true 
ENT.NextMeleeAttackTime = 1.5
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 15
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.HasLeapAttack = true 
ENT.LeapAttackDamage = 15
ENT.TimeUntilLeapAttackDamage = 0.6
ENT.NextAnyAttackTime_Leap = 1.5
ENT.NextLeapAttackTime = 8
ENT.LeapAttackAnimationDecreaseLengthAmount = 1.4
ENT.AnimTbl_LeapAttack = {"vjseq_hunterjump"}
ENT.LeapAttackVelocityForward = 100 
ENT.LeapAttackVelocityUp = 200
ENT.LeapDistance = 200
ENT.LeapToMeleeDistance = 150
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 
ENT.GibOnDeathDamagesTable = {"All"}

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_recb/hunter/hu_runleft.wav","vj_recb/hunter/hu_runright.wav"}
ENT.SoundTbl_Idle = {"vj_recb/hunter/hu_idle1.wav","vj_recb/hunter/hu_idle2.wav","vj_recb/hunter/hu_idle3.wav"}
ENT.SoundTbl_Alert = {"vj_recb/hunter/hu_alert.wav"}
ENT.SoundTbl_CallForHelp = {"vj_recb/hunter/hu_scream.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_recb/hunter/hu_alert.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_recb/hunter/hu_clawhit.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_recb/hunter/hu_slash.wav"}
ENT.SoundTbl_Pain = {"vj_recb/hunter/hu_pain.wav"}
ENT.SoundTbl_Death = {"vj_recb/hunter/hu_die.wav"}
ENT.SoundTbl_LeapAttackJump = {"vj_recb/hunter/hu_jump.wav"}
ENT.SoundTbl_LeapAttackDamage = {"vj_recb/hunter/hu_clawhit.wav"}
ENT.SoundTbl_LeapAttackDamageMiss = {"npc/zombie/claw_miss1.wav","npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_Impact = {"vj_recb/shared/hit_flesh1.wav","vj_recb/shared/hit_flesh2.wav","vj_recb/shared/hit_flesh3.wav","vj_recb/shared/hit_flesh4.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100

-- Custom
ENT.GraySkin = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
end
	if key == "death" then
		VJ_EmitSound(self, "vj_recb/hunter/hu_bodyfall.wav", 85, 100)
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize() 
--VJ_EmitSound(self,{"hunter/hu_scream.wav"},70)
	--self:VJ_ACT_PLAYACTIVITY("scream",true,1.76,true)
	self:SetCollisionBounds(Vector(18, 22, 60), Vector(-18, -22, 0))
	
    if math.random(1,2) == 1 then
	        self.GraySkin = true
			self:SetBodygroup(0,1)
	end		
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnCallForHelp(ally)
if math.random(1,2) == 1 then
        self:VJ_ACT_PLAYACTIVITY("vjseq_scream",true,2,true)	
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	local hunter_attack = math.random(1,2)
	
		if hunter_attack == 1 then
			self.AnimTbl_MeleeAttack = {"vjseq_attack1"}

		elseif hunter_attack == 2 then
			self.AnimTbl_MeleeAttack = {"vjseq_attack2"}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	if self.GraySkin == false && hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 then
	    self:EmitSound(Sound("vj_recb/zombie/zom_headburst.wav",70))
		self:SetBodygroup(0,2)
	
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
	if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_GUTSHOT,ACT_DIE_HEADSHOT}
	else
		self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE}
    end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/