AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/zombie_female_beta.mdl"}
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
function ENT:Zombie_CustomOnInitialize()	
	self:SetSkin(math.random(0,2))
end		
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetVomitZombie() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_Miss()
    if !self.Crippled && !self.Vomit_Zombie then
	    self.PlayingAttackAnimation = false
	    self:StopAttacks(false)
	    self.vACT_StopAttacks = false
        self:VJ_ACT_PLAYACTIVITY("flinch",true,false,false)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup) end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup) end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_OnBleed(dmginfo,hitgroup) end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Cripple() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    if GetConVar("VJ_RECB_Gib"):GetInt() == 0 then return end
	if dmginfo:GetDamageForce():Length() < 800 then return end
	if hitgroup == HITGROUP_HEAD then
	    VJ_EmitSound(self,"vj_recb/zombie/zom_headburst.wav",75,100)
		self:SetBodygroup(0,1)
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