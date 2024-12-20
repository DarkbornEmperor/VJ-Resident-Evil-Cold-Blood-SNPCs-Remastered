/*--------------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "obj_vj_projectile_base"
ENT.PrintName = "Spider Spit"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Information = "Projectile, usually used for NPCs & Weapons"
ENT.Category = "Projectiles"

ENT.VJTag_ID_Danger = true

if CLIENT then
    local Name = "Spider Spit"
    local LangName = "obj_vj_recb_spider_spit"
    language.Add(LangName, Name)
    killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
    language.Add("#"..LangName, Name)
    killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/spitball_medium.mdl"
ENT.ProjectileType = VJ.PROJ_TYPE_GRAVITY
ENT.DoesDirectDamage = false
ENT.DoesRadiusDamage = true
ENT.RadiusDamageRadius = 30
ENT.RadiusDamage = 15
ENT.RadiusDamageUseRealisticRadius = true
ENT.RadiusDamageType = DMG_POISON
ENT.SoundTbl_OnCollide = "vj_recb/spider/spidershot.wav"
ENT.CollisionDecals = "VJ_RECB_Spider_Spit"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetNoDraw(true)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/