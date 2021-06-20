AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/recb/recb_prototyrant.mdl"} 
ENT.StartHealth = 3000
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"drg_re1_blood_impact"}
ENT.CustomBlood_Decal = {"VJ_RECB_Blood_Red"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.FootStepTimeRun = 0.27
ENT.FootStepTimeWalk = 0.6
ENT.NextMeleeAttackTime = 1.5
ENT.AnimTbl_Run = {ACT_WALK}
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.AnimTbl_Death = {ACT_DIEVIOLENT}
ENT.HasDeathRagdoll = false
ENT.DisableFootStepSoundTimer = true 

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"tyrant/tyrant_foot.wav"}
ENT.SoundTbl_Alert = {"tyrant/tyrant_roar.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"tyrant/tyrant_swing2.wav","tyrant/tyrant_swing.wav"}
ENT.SoundTbl_MeleeAttack = {"tyrant/tyrant_stab.wav","tyrant/tyrant_slash.wav"}
ENT.SoundTbl_Impact = {"shared/hit_flesh1.wav","shared/hit_flesh2.wav","shared/hit_flesh3.wav","shared/hit_flesh4.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100

-- Custom
ENT.Tyrant_Rage = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
end
	if key == "death" then
		VJ_EmitSound(self, "tyrant/tyrant_bodyhit.wav", 85, math.random(100,100))
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize() 
	self:SetCollisionBounds(Vector(20, 20, 100), Vector(-20, -20, 0))	
	
	if math.random(1,10) == 1 then
	 self.Tyrant_Rage = true
	 self:TyrantRage()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------	
function ENT:MultipleMeleeAttacks()
	local randattack = math.random(1,2)
	if randattack == 1 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack1"}
		self.MeleeAttackDamage = 35
		self.MeleeAttackDistance = 40
		self.MeleeAttackDamageDistance = 90
		
	elseif randattack == 2 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack2"}
		self.MeleeAttackDamage = 35
		self.MeleeAttackDistance = 40
		self.MeleeAttackDamageDistance = 90

	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
if math.random(1,2) == 1 && self.Tyrant_Rage == true then
        self:VJ_ACT_PLAYACTIVITY("vjseq_attack2",true,1,false)	
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	 if self.Tyrant_Rage == true then
	    dmginfo:ScaleDamage(0.75)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TyrantRage()
     if self.Tyrant_Rage == true then
       --self:VJ_ACT_PLAYACTIVITY("attack2",true,1,false)
       --VJ_EmitSound(self,{"tyrant/tyrant_roar.wav"},80,100)  
        self.AnimTbl_Run = {ACT_RUN}	
    end
end	 
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/