AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b2/zombie.mdl"
ENT.StartHealth = 250
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE","FACTION_RE1","FACTION_REPS1","RE1HD_ZOMBIE","FACTION_RE3ZOMBIE","RESISTANCE_ENEMY","FACTION_MRX","FACTION_REDCUC","FACTION_REDCUCEM","C_MONSTER_LAB"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_recb_blood_red"}
ENT.BloodDecal = {"VJ_RECB_Blood_Red"}
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 15
ENT.MeleeAttackDamageDistance = 45
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
-- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(40, 25, -50),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
-- Custom
ENT.HeadHealth = 20
ENT.ChestHealth = 30
ENT.RArmHealth = 15
ENT.LArmHealth = 15
ENT.LegHealth = 15
ENT.Crippled = false
ENT.HasBeenKnocked = false
ENT.CanBeKnocked = true
ENT.NextKnockTimeT = 0
ENT.Head_Damaged = false
ENT.Chest_Damaged = false
ENT.RArm_Damaged = false
ENT.LArm_Damaged = false
ENT.RECB_CurEnt = NULL
ENT.RECB_CurEntMoveType = MOVETYPE_WALK
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "step_getup" then
        VJ.EmitSound(self,"vj_recb/zombie/footstep"..math.random(1,3)..".wav",70,100)
    elseif key == "melee" then
        self:ExecuteMeleeAttack()
    elseif key == "vomit" then
        self:ExecuteMeleeAttack()
        VJ.EmitSound(self,"vj_recb/zombie/vomit.wav",75,100)
        ParticleEffectAttach("vj_recb_vomit", PATTACH_POINT_FOLLOW, self, self:LookupAttachment("mouth"))
    elseif key == "death_knee" then
        VJ.EmitSound(self,"vj_recb/zombie/zom_knee.wav",75,100)
    elseif key == "death" then
        VJ.EmitSound(self,"vj_recb/zombie/zom_bodyfall"..math.random(1,2)..".wav",75,100)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:ZombieVoices()
    self:Zombie_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Init()
 self:SetBodygroup(0,1)
 local zombieSkin = math.random(1,2)
 if zombieSkin == 1 then
    self:SetSkin(math.random(0,3))
 elseif zombieSkin == 2 && math.random(1,3) == 1 then
    self:SetSkin(math.random(4,5))
    self:SetBodygroup(7,math.random(0,1))
end
    self.SoundTbl_FootStep = {
    "vj_recb/zombie/footstep1.wav",
    "vj_recb/zombie/footstep2.wav",
    "vj_recb/zombie/footstep3.wav"
}
    self.SoundTbl_Impact = {
    "vj_recb/shared/hit_flesh1.wav",
    "vj_recb/shared/hit_flesh2.wav",
    "vj_recb/shared/hit_flesh3.wav",
    "vj_recb/shared/hit_flesh4.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoices()
    local voice = math.random(1,11)
    if voice == 1 then
        self.SoundTbl_Idle =
        "vj_recb/zombie/male/male1/zom_idle.wav"

        self.SoundTbl_Alert =
        "vj_recb/zombie/male/male1/zom_idle.wav"

        self.SoundTbl_BeforeMeleeAttack =
        "vj_recb/zombie/male/male1/zom_attack.wav"

        self.SoundTbl_Pain =
        "vj_recb/zombie/male/male1/zom_pain.wav"

        self.SoundTbl_Death =
        "vj_recb/zombie/male/male1/zom_die.wav"

    elseif voice == 2 then
        self.SoundTbl_Idle =
        "vj_recb/zombie/male/male2/zom_idle.wav"

        self.SoundTbl_Alert =
        "vj_recb/zombie/male/male2/zom_idle.wav"

        self.SoundTbl_BeforeMeleeAttack =
        "vj_recb/zombie/male/male2/zom_attack.wav"

        self.SoundTbl_Pain =
        "vj_recb/zombie/male/male2/zom_pain.wav"

        self.SoundTbl_Death =
        "vj_recb/zombie/male/male2/zom_die.wav"

    elseif voice == 3 then
        self.SoundTbl_Idle =
        "vj_recb/zombie/male/male3/zom_idle.wav"

        self.SoundTbl_Alert =
        "vj_recb/zombie/male/male3/zom_idle.wav"

        self.SoundTbl_BeforeMeleeAttack =
        "vj_recb/zombie/male/male3/zom_attack.wav"

        self.SoundTbl_Pain =
        "vj_recb/zombie/male/male3/zom_pain.wav"

        self.SoundTbl_Death =
        "vj_recb/zombie/male/male3/zom_die.wav"

    elseif voice == 4 then
        self.SoundTbl_Idle =
        "vj_recb/zombie/male/male4/zom_idle.wav"

        self.SoundTbl_Alert =
        "vj_recb/zombie/male/male4/zom_idle.wav"

        self.SoundTbl_BeforeMeleeAttack =
        "vj_recb/zombie/male/male4/zom_attack.wav"

        self.SoundTbl_Pain =
        "vj_recb/zombie/male/male4/zom_pain.wav"

        self.SoundTbl_Death =
        "vj_recb/zombie/male/male4/zom_die.wav"

    elseif voice == 5 then
        self.SoundTbl_Idle =
        "vj_recb/zombie/male/male5/zom_idle.wav"

        self.SoundTbl_Alert =
        "vj_recb/zombie/male/male5/zom_idle.wav"

        self.SoundTbl_BeforeMeleeAttack =
        "vj_recb/zombie/male/male5/zom_attack.wav"

        self.SoundTbl_Pain =
        "vj_recb/zombie/male/male5/zom_pain.wav"

        self.SoundTbl_Death =
        "vj_recb/zombie/male/male5/zom_die.wav"

    elseif voice == 6 then
        self.SoundTbl_Idle =
        "vj_recb/zombie/male/male6/zom_idle.wav"

        self.SoundTbl_Alert =
        "vj_recb/zombie/male/male6/zom_idle.wav"

        self.SoundTbl_BeforeMeleeAttack =
        "vj_recb/zombie/male/male6/zom_attack.wav"

        self.SoundTbl_Pain =
        "vj_recb/zombie/male/male6/zom_pain.wav"

        self.SoundTbl_Death =
        "vj_recb/zombie/male/male6/zom_die.wav"

    elseif voice == 7 then
        self.SoundTbl_Idle =
        "vj_recb/zombie/male/male7/zom_idle.wav"

        self.SoundTbl_Alert =
        "vj_recb/zombie/male/male7/zom_idle.wav"

        self.SoundTbl_BeforeMeleeAttack =
        "vj_recb/zombie/male/male7/zom_attack.wav"

        self.SoundTbl_Pain =
        "vj_recb/zombie/male/male7/zom_pain.wav"

        self.SoundTbl_Death =
        "vj_recb/zombie/male/male7/zom_die.wav"

    elseif voice == 8 then
        self.SoundTbl_Idle =
        "vj_recb/zombie/male/male8/zom_idle.wav"

        self.SoundTbl_Alert =
        "vj_recb/zombie/male/male8/zom_idle.wav"

        self.SoundTbl_BeforeMeleeAttack =
        "vj_recb/zombie/male/male8/zom_attack.wav"

        self.SoundTbl_Pain =
        "vj_recb/zombie/male/male8/zom_pain.wav"

        self.SoundTbl_Death =
        "vj_recb/zombie/male/male8/zom_die.wav"

    elseif voice == 9 then
        self.SoundTbl_Idle =
        "vj_recb/zombie/male/male9/zom_idle.wav"

        self.SoundTbl_Alert =
        "vj_recb/zombie/male/male9/zom_idle.wav"

        self.SoundTbl_BeforeMeleeAttack =
        "vj_recb/zombie/male/male9/zom_attack.wav"

        self.SoundTbl_Pain =
        "vj_recb/zombie/male/male9/zom_pain.wav"

        self.SoundTbl_Death =
        "vj_recb/zombie/male/male9/zom_die.wav"

    elseif voice == 10 then
        self.SoundTbl_Idle =
        "vj_recb/zombie/male/male10/zom_idle.wav"

        self.SoundTbl_Alert =
        "vj_recb/zombie/male/male10/zom_idle.wav"

        self.SoundTbl_BeforeMeleeAttack =
        "vj_recb/zombie/male/male10/zom_attack.wav"

        self.SoundTbl_Pain =
        "vj_recb/zombie/male/male10/zom_pain.wav"

        self.SoundTbl_Death =
        "vj_recb/zombie/male/male10/zom_die.wav"

    elseif voice == 11 then
        self.SoundTbl_Idle =
        "vj_recb/zombie/male/male11/zom_idle.wav"

        self.SoundTbl_Alert =
        "vj_recb/zombie/male/male11/zom_idle.wav"

        self.SoundTbl_BeforeMeleeAttack =
        "vj_recb/zombie/male/male11/zom_attack.wav"

        self.SoundTbl_Pain =
        "vj_recb/zombie/male/male11/zom_pain.wav"

        self.SoundTbl_Death =
        "vj_recb/zombie/male/male11/zom_die.wav"
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
 if act == ACT_IDLE && self.HasBeenKnocked then
    return VJ.SequenceToActivity(self,"on_floor")
end
    if self.Crippled then
    if act == ACT_IDLE then
        return ACT_CROUCHIDLE
    elseif act == ACT_WALK or act == ACT_RUN then
        return ACT_WALK_HURT
    end
end
    return self.BaseClass.TranslateActivity(self,act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttack(status,enemy)
    if status == "Init" then
    if self.Crippled then
        self.AnimTbl_MeleeAttack = "crawl_attack"
        self.SoundTbl_MeleeAttackExtra = {"vj_recb/zombie/bite1.wav","vj_recb/zombie/bite2.wav"}
    return end
        self.AnimTbl_MeleeAttack = "attack2"
        self.MeleeAttackDamageType = DMG_SLASH
        self.MeleeAttackDamage = 25
        self.SoundTbl_MeleeAttackExtra = {"vj_recb/zombie/bite1.wav","vj_recb/zombie/bite2.wav"}
    if math.random(1,4) == 1 then
        self.AnimTbl_MeleeAttack = "vomit"
        self.MeleeAttackDamageType = DMG_ACID
        self.MeleeAttackDamage = 20
        self.SoundTbl_MeleeAttackExtra = "vj_recb/zombie/vomit_floor.wav"
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status,ent,isProp)
   if status == "PreDamage" then
   if self:IsOnFire() then ent:Ignite(4) end
   if !isProp && self:GetSequence() == self:LookupSequence("attack2") then
   if ent.IsVJBaseSNPC && VJ.PICK(ent.BloodParticle) then ParticleEffectAttach(VJ.PICK(ent.BloodParticle),PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
   elseif (ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then ParticleEffectAttach("blood_impact_red_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
    end
end
 if self:GetSequence() == self:LookupSequence("attack2") then
 if ent.IsVJBaseSNPC && (ent.MovementType != VJ_MOVETYPE_GROUND or ent.VJ_ID_Boss or ent.IsVJBaseSNPC_Tank) then self.RECB_Grappled = false return false end
 if !self.RECB_Grappled then
    self.RECB_Grappled = true
    //ent:SetVelocity(self:MeleeAttackKnockbackVelocity(ent))
 if self.RECB_CurEnt != ent then -- If the grabbed enemy is a new enemy then reset the enemy values
    self:ResetGrapple()
    self.RECB_CurEntMoveType = ent:GetMoveType()
end
 if ent:IsPlayer() or (ent.IsVJBaseSNPC && ent.MovementType == VJ_MOVETYPE_GROUND && !ent.VJ_ID_Boss && !ent.IsVJBaseSNPC_Tank) then
    self:Grapple()
end
   if ent:IsNPC() && !ent.IsVJBaseSNPC && ent:GetMoveType(MOVETYPE_STEP) then
        self:Grapple_NPC() end
        end
    end
end
    if status == "Miss" then
    if self.Crippled or self:GetSequence() == self:LookupSequence("vomit") then return end
        self.AttackAnimTime = 0
        self:StopAttacks(false)
        self.vACT_StopAttacks = false
        self:PlayAnim("lunge_1",true,false,false)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Grapple()
 if self.RECB_CurEnt.IsVJBaseSNPC then
    self.RECB_CurEnt:StopMoving()
    self.RECB_CurEnt:SetMoveType(MOVETYPE_NONE)
    self.RECB_CurEnt:SetState(VJ_STATE_ONLY_ANIMATION)
    self.RECB_CurEnt:ForceSetEnemy(self,true,true)
    self.RECB_CurEnt:SetTurnTarget(self)
end
 if self.RECB_CurEnt:IsPlayer() then
    local ang = self:GetAngles()
    self.RECB_CurEnt:SetMoveType(MOVETYPE_NONE)
    self.RECB_CurEnt:SetEyeAngles(Angle(ang.x,(self:GetPos() -self.RECB_CurEnt:GetPos()):Angle().y,ang.z))
end
    timer.Create(self:EntIndex().."VJ_RECB_Grapple",0.1,0,function()
    if IsValid(self) && self.AttackAnimTime < CurTime() then
        self.RECB_Grappled = false
        self:ResetGrapple()
        timer.Remove(self:EntIndex().."VJ_RECB_Grapple")
        end
    end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Grapple_NPC()
 if self.RECB_CurEnt:IsNPC() or self.RECB_CurEnt:IsNextBot() then
    self.RECB_CurEnt:StopMoving()
    self.RECB_CurEnt:SetMoveType(MOVETYPE_NONE)
    local ang = self:GetAngles()
    self.RECB_CurEnt:SetAngles(Angle(ang.x,(self:GetPos() -self.RECB_CurEnt:GetPos()):Angle().y,ang.z))
end
    timer.Create(self:EntIndex().."VJ_RECB_Grapple",0.1,0,function()
    if IsValid(self) && self.AttackAnimTime < CurTime() then
        self.RECB_Grappled = false
        self:ResetGrapple()
        timer.Remove(self:EntIndex().."VJ_RECB_Grapple")
        end
    end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ResetGrapple()
 if !IsValid(self.RECB_CurEnt) then return end
 if self.RECB_CurEnt.IsVJBaseSNPC then
    self.RECB_CurEnt:SetState()
end
    self.RECB_CurEnt:SetMoveType(self.RECB_CurEntMoveType) -- Reset the enemy's move type
    if (self.RECB_CurEnt:IsNPC() or self.RECB_CurEnt:IsNextBot()) && self.RECB_CurEnt:GetMoveType(MOVETYPE_NONE) then self.RECB_CurEnt:SetMoveType(MOVETYPE_STEP) end
    if self.RECB_CurEnt:IsPlayer() && self.RECB_CurEnt:GetMoveType(MOVETYPE_NONE) then self.RECB_CurEnt:SetMoveType(MOVETYPE_WALK) end
    self.RECB_CurEnt = NULL
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(ent)
    return self:GetForward()*-150 + self:GetUp()*10
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFlinch(dmginfo,hitgroup,status)
    if status == "Init" then
        return self.Crippled or self.HasBeenKnocked or self:GetSequence() == self:LookupSequence("floor_getup") -- If we are crawling then DO NOT flinch!
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)
 local animTime = VJ.AnimDuration(self,self:GetSequenceName(self:GetSequence()))
 if status == "PostDamage" && self.CanBeKnocked && !self.HasBeenKnocked && math.random(1,16) == 1 && CurTime() > self.NextKnockTimeT && !self.Crippled && self:Health() > 0 then
    self:PlayAnim("knocked_to_floor",true,false,false)
    self.MovementType = VJ_MOVETYPE_STATIONARY
    self.CanTurnWhileStationary = false
    self.HasPoseParameterLooking = false
    self.CallForHelp = false
    self.HasBeenKnocked = true
    self.CanBeKnocked = false
    self:AddFlags(FL_NOTARGET)
    self.HasIdleSounds = false
    self.HasBreathSound = false
    self.EnemyDetection = true
    self.DisableMakingSelfEnemyToNPCs = true
    self.HasMeleeAttack = false

 timer.Simple(math.random(GetConVar("VJ_RECB_Zombie_GetUpTime1"):GetInt(),GetConVar("VJ_RECB_Zombie_GetUpTime2"):GetInt()),function()
 if IsValid(self) && !self.DeathAnimationCodeRan then
 if !self.Crippled then
    self:PlayAnim("floor_getup",true,false,false)
    animTime = VJ.AnimDuration(self,"floor_getup")
 elseif self.Crippled then
    self:PlayAnim("crawl_attack",true,false,false)
    self:SetCollisionBounds(Vector(13,13,25),Vector(-13,-13,0))
    animTime = VJ.AnimDuration(self,"crawl_attack")
end
    self.HasPoseParameterLooking = true
    self.CallForHelp = true
    self.HasBeenKnocked = false
    self:RemoveFlags(FL_NOTARGET)
    self.HasIdleSounds = true
    self.HasBreathSound = true
    self.NextKnockTimeT = CurTime() + math.Rand(5,10)
end
    timer.Simple(animTime,function()
    if IsValid(self) && !self.DeathAnimationCodeRan then
        self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
        self.EnemyDetection = false
        self.DisableMakingSelfEnemyToNPCs = false
        self.HasMeleeAttack = true end
        end)
    end)
end
 if GetConVar("VJ_RECB_Dismember"):GetInt() == 0 then return end
 if status == "PostDamage" then
 if !self.Crippled then
 local legs = {6,7}
 if VJ.HasValue(legs,hitgroup) then
    self.LegHealth = self.LegHealth -dmginfo:GetDamage()
 if self.LegHealth <= 0 && self:Health() > 0 then
    self.Crippled = true
 local anim = "legless_fall"
 if hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG then
    self:Dismember(hitgroup)
end
        self:PlayAnim(anim,true,false,false)
        self:Cripple()
        end
    end
end
 local head = {1} -- Head
 local chest = {2} -- Chest
 local lArm = {4} -- Left Arm
 local rArm = {5} -- Right Arm
 if VJ.HasValue(head,hitgroup) then
    self.HeadHealth = self.HeadHealth -dmginfo:GetDamage()
 if !self.Head_Damaged && hitgroup == HITGROUP_HEAD && self.HeadHealth <= 0 && self:Health() > 0 then
    self.Head_Damaged = true
    self:Dismember(hitgroup)
end
 elseif VJ.HasValue(chest,hitgroup) then
    self.ChestHealth = self.ChestHealth -dmginfo:GetDamage()
 if !self.Chest_Damaged && hitgroup == HITGROUP_CHEST && self.ChestHealth <= 0 && self:Health() > 0 then
    self.Chest_Damaged = true
    self:Dismember(hitgroup)
end
 elseif VJ.HasValue(lArm,hitgroup) then
    self.LArmHealth = self.LArmHealth -dmginfo:GetDamage()
 if !self.LArm_Damaged && hitgroup == HITGROUP_LEFTARM && self.LArmHealth <= 0 && self:Health() > 0 then
    self.LArm_Damaged = true
    self:Dismember(hitgroup)
end
    elseif VJ.HasValue(rArm,hitgroup) then
        self.RArmHealth = self.RArmHealth -dmginfo:GetDamage()
    if !self.RArm_Damaged && hitgroup == HITGROUP_RIGHTARM && self.RArmHealth <= 0 && self:Health() > 0 then
        self.RArm_Damaged = true
        self:Dismember(hitgroup) end
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Dismember(hitgroup)
    if hitgroup == HITGROUP_HEAD then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_neck_break.wav",75,100)
        self:SetBodygroup(0,0)
        self:SetBodygroup(1,2)
        self:SetBodygroup(7,0)
        self:RemoveAllDecals()
    elseif hitgroup == HITGROUP_CHEST then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("chest")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_armlost.wav",75,100)
        self:SetBodygroup(0,0)
        self:SetBodygroup(4,1)
        self:RemoveAllDecals()
    elseif hitgroup == HITGROUP_LEFTARM then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("larm")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_armlost.wav",75,100)
        self:SetBodygroup(0,0)
        self:SetBodygroup(6,1)
        self:RemoveAllDecals()
    elseif hitgroup == HITGROUP_RIGHTARM then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("rarm")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_armlost.wav",75,100)
        self:SetBodygroup(0,0)
        self:SetBodygroup(5,1)
        self:RemoveAllDecals()
    elseif hitgroup == HITGROUP_LEFTLEG then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("lleg")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_leglost.wav",75,100)
        self:SetBodygroup(0,0)
        self:SetBodygroup(3,1)
        self:RemoveAllDecals()
    elseif hitgroup == HITGROUP_RIGHTLEG then
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("rleg")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_leglost.wav",75,100)
        self:SetBodygroup(0,0)
        self:SetBodygroup(2,1)
        self:RemoveAllDecals()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Cripple()
    self:SetHullType(HULL_TINY)
    self:SetCollisionBounds(Vector(13,13,25),Vector(-13,-13,0))
    self.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -15),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(10, 0, -30),
}
    self.SoundTbl_FootStep = {
    "vj_recb/zombie/crawl.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
 if status == "Init" && self.MovementType == VJ_MOVETYPE_STATIONARY then
    self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
end
 if status == "Init" then
    self:ResetGrapple()
    VJ_RECB_DeathCode(self)
    if GetConVar("VJ_RECB_Gib"):GetInt() == 0 then return end
    if dmginfo:GetDamageForce():Length() < 800 then return end
    if hitgroup == HITGROUP_HEAD then
        self.HasDeathSounds = false
        ParticleEffect("vj_recb_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
        VJ.EmitSound(self,"vj_recb/zombie/zom_headburst.wav",75,100)
        self:SetBodygroup(0,0)
        self:SetBodygroup(1,3)
        self:SetBodygroup(7,0)
        self:RemoveAllDecals()
    elseif hitgroup == HITGROUP_CHEST && !self.Chest_Damaged then
        self:Dismember(hitgroup)
    elseif hitgroup == HITGROUP_LEFTARM && !self.LArm_Damaged then
        self:Dismember(hitgroup)
    elseif hitgroup == HITGROUP_RIGHTARM && !self.RArm_Damaged then
        self:Dismember(hitgroup)
    elseif hitgroup == HITGROUP_LEFTLEG && !self.Crippled then
        self:Dismember(hitgroup)
    elseif hitgroup == HITGROUP_RIGHTLEG && !self.Crippled then
        self:Dismember(hitgroup)

     /*if self.HasGibOnDeathEffects then
        local bloodEffect = ents.Create("info_particle_system")
        bloodEffect:SetKeyValue("effect_name","blood_advisor_pierce_spray")
        bloodEffect:SetPos(self:GetAttachment(self:LookupAttachment("head")).Pos)
        bloodEffect:SetAngles(self:GetAttachment(self:LookupAttachment("head")).Ang)
        bloodEffect:SetParent(self)
        bloodEffect:Fire("SetParentAttachment","head")
        bloodEffect:Spawn()
        bloodEffect:Activate()
        bloodEffect:Fire("Start","",0)
        bloodEffect:Fire("Kill","",5)
        end*/
    end
end
 if status == "DeathAnim" then
    if hitgroup == HITGROUP_HEAD then
        self.AnimTbl_Death = {ACT_DIE_HEADSHOT,ACT_DIE_GUTSHOT}
     else
        self.AnimTbl_Death = {ACT_DIESIMPLE,ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIEVIOLENT,ACT_DIE_CHESTSHOT,ACT_DIE_GUTSHOT,ACT_DIE_BACKSHOT}
end
     if self.Crippled then
        self.AnimTbl_Death = {"vjseq_crawl_die"}
     elseif self.HasBeenKnocked then
        self.AnimTbl_Death = {"floor_death"}
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_RECB_ApplyCorpse(self,corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    self:ResetGrapple()
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/