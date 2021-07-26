AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/recb_hunter.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 250
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
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
ENT.LeapAttackDamageDistance = 90
ENT.TimeUntilLeapAttackDamage = false
ENT.NextAnyAttackTime_Leap = 1.5
ENT.NextLeapAttackTime = 8
ENT.LeapAttackAnimationDecreaseLengthAmount = 1.4
ENT.AnimTbl_LeapAttack = {ACT_SPECIAL_ATTACK1}
ENT.LeapAttackVelocityForward = 100 
ENT.LeapAttackVelocityUp = 250
ENT.LeapDistance = 300
ENT.LeapToMeleeDistance = 200
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 
ENT.GibOnDeathDamagesTable = {"All"}
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -35), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_recb/hunter/hu_runleft.wav","vj_recb/hunter/hu_runright.wav"}
ENT.SoundTbl_Idle = {"vj_recb/hunter/hu_idle1.wav","vj_recb/hunter/hu_idle2.wav","vj_recb/hunter/hu_idle3.wav"}
ENT.SoundTbl_Alert = {"vj_recb/hunter/hu_alert.wav"}
ENT.SoundTbl_CallForHelp = {"vj_recb/hunter/hu_scream.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_recb/hunter/hu_alert.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"vj_recb/hunter/hu_clawhit.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_recb/hunter/hu_slash.wav"}
ENT.SoundTbl_LeapAttackJump = {"vj_recb/hunter/hu_jump.wav"}
ENT.SoundTbl_LeapAttackDamage = {"vj_recb/hunter/hu_clawhit.wav"}
ENT.SoundTbl_LeapAttackDamageMiss = {"vj_recb/hunter/hu_slash.wav"}
ENT.SoundTbl_Pain = {"vj_recb/hunter/hu_pain.wav"}
ENT.SoundTbl_Death = {"vj_recb/hunter/hu_die.wav"}
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
	if key == "attack_leap" then
		self:LeapDamageCode()
end
	if key == "death" then
		VJ_EmitSound(self, "vj_recb/hunter/hu_bodyfall.wav", 85, 100)
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
if GetConVarNumber("VJ_RECB_Gibbing") == 0 then
        self.AllowedToGib = false 
        self.HasGibOnDeath = false 
        self.HasGibOnDeathSounds = false 
        self.HasGibDeathParticles = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize() 
--VJ_EmitSound(self,{"hunter/hu_scream.wav"},70)
	--self:VJ_ACT_PLAYACTIVITY("scream",true,1.76,true)
	self:SetCollisionBounds(Vector(16, 16, 60), Vector(-16, -16, 0))
	
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
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
	if self.GraySkin == false && hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 && self.HasGibDeathParticles == true then
	    self:EmitSound(Sound("vj_recb/zombie/zom_headburst.wav",70))
		self:SetBodygroup(0,2)
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
		
	elseif self.GraySkin == true && hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 && self.HasGibDeathParticles == true then
		self:EmitSound(Sound("vj_recb/zombie/zom_headburst.wav",70))
	    self:SetBodygroup(0,3)		
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
	return true,{DeathAnim=true}
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