include("entities/npc_vj_recb_spider_giant/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b3/giantspider_smaller.mdl"
ENT.StartHealth = 130
ENT.MeleeAttackDistance = 50
ENT.MeleeAttackDamageDistance = 70
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(30, 30, 35), Vector(-30, -30, 0))
    self:Spider_Init()
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/