include("entities/npc_vj_recb_zombie_male/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b3/zombie_priest.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)
    local animTime = VJ.AnimDuration(self,self:GetSequenceName(self:GetSequence()))
    if status == "PostDamage" && self.CanBeKnocked && !self.HasBeenKnocked && math.random(1,16) == 1 && CurTime() > self.NextKnockTimeT && !self.Crippled && self:Health() > 0 then
       self:VJ_ACT_PLAYACTIVITY("knocked_to_floor",true,false,false)
       self.MovementType = VJ_MOVETYPE_STATIONARY
       self.CanTurnWhileStationary = false
       self.HasPoseParameterLooking = false
       self.CallForHelp = false
       self.HasBeenKnocked = true
       self.CanBeKnocked = false
       self:AddFlags(FL_NOTARGET)
       self.HasIdleSounds = false
       self.HasBreathSound = false
       self.DisableFindEnemy = true
       self.DisableMakingSelfEnemyToNPCs = true
       self.HasMeleeAttack = false

    timer.Simple(math.random(GetConVar("VJ_RECB_Zombie_GetUpTime1"):GetInt(),GetConVar("VJ_RECB_Zombie_GetUpTime2"):GetInt()),function()
    if IsValid(self) && !self.DeathAnimationCodeRan then
       self:VJ_ACT_PLAYACTIVITY("floor_getup",true,false,false)
       animTime = VJ.AnimDuration(self,"floor_getup")
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
        self.DisableFindEnemy = false
        self.DisableMakingSelfEnemyToNPCs = false
        self.HasMeleeAttack = true end end)
        end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
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
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/