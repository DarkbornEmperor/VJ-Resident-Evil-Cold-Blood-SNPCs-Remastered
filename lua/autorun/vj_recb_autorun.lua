/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Resident Evil: Cold Blood SNPCs"
local AddonName = "Resident Evil: Cold Blood"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_recb_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	local vCat = "Resident Evil: Cold Blood"
	VJ.AddNPC("Zombie (Male)","npc_vj_recb_zombie",vCat)
	VJ.AddNPC("Zombie (Female)","npc_vj_recb_zombie_female",vCat)
	VJ.AddNPC("Zombie (Soldier)","npc_vj_recb_zombie_soldier",vCat)
	VJ.AddNPC("Zombie (Torso)","npc_vj_recb_zombie_torso",vCat)
	VJ.AddNPC("Crimson Head","npc_vj_recb_crimsonhead",vCat)
	VJ.AddNPC("Cerberus","npc_vj_recb_cerberus",vCat)
	VJ.AddNPC("Tyrant-103","npc_vj_recb_tyrant",vCat)
	VJ.AddNPC("Proto-Tyrant","npc_vj_recb_prototyrant",vCat)
	VJ.AddNPC("Hunter","npc_vj_recb_hunter",vCat)
    VJ.AddNPC("Licker","npc_vj_recb_licker",vCat)
	VJ.AddNPC("Spider (Black Tiger)","npc_vj_recb_spider_blacktiger",vCat)
	VJ.AddNPC("Spider","npc_vj_recb_spider_giant",vCat)
	VJ.AddNPC("Spider (Baby)","npc_vj_recb_spider_baby",vCat)
	VJ.AddNPC("Crawler","npc_vj_recb_crawler",vCat)
	VJ.AddNPC("Snake","npc_vj_recb_snake",vCat)
	VJ.AddNPC("Ant","npc_vj_recb_ant",vCat)
	VJ.AddNPC("Flyclaw","npc_vj_recb_flyclaw",vCat)
	VJ.AddNPC("Crow","npc_vj_recb_crow",vCat)
	VJ.AddNPC("Neptune","npc_vj_recb_neptune",vCat)

game.AddDecal("VJ_RECB_Blood_Red",{"vj_hl/decals/hl_blood01","vj_hl/decals/hl_blood02","vj_hl/decals/hl_blood03","vj_hl/decals/hl_blood04","vj_hl/decals/hl_blood05","vj_hl/decals/hl_blood06","vj_hl/decals/hl_blood07","vj_hl/decals/hl_blood08"})
game.AddDecal("VJ_RECB_Blood_Red_Large",{"vj_hl/decals/hl_bigblood01","vj_hl/decals/hl_bigblood02"})
game.AddDecal("VJ_RECB_Blood_Yellow",{"vj_hl/decals/hl_yblood01","vj_hl/decals/hl_yblood02","vj_hl/decals/hl_yblood03","vj_hl/decals/hl_yblood04","vj_hl/decals/hl_yblood05","vj_hl/decals/hl_yblood06"})

game.AddParticles( "particles/drg_re1_monster_effects.pcf" )
game.AddParticles( "particles/drg_re2_fire_effects.pcf" )
PrecacheParticleSystem( "drg_re2_fire_huge" )
PrecacheParticleSystem( "drg_re2_fire_large" )
PrecacheParticleSystem( "drg_re2_fire_medium" )
PrecacheParticleSystem( "drg_re2_fire_small" )
PrecacheParticleSystem( "drg_re2_fire_tiny" )
PrecacheParticleSystem( "drg_re1_blood_impact" )
PrecacheParticleSystem( "drg_re1_blood_impact_large" )
PrecacheParticleSystem( "drg_re1_blood_impact_acid" )
PrecacheParticleSystem( "drg_re1_blood_impact_green" )
PrecacheParticleSystem( "drg_re1_blood_impact_plant" )
PrecacheParticleSystem( "drg_re1_blood_impact_plant_small" )

-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("ERROR!")
				VJF:SetSize(790,560)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end
				
				local VJURL = vgui.Create("DHTML",VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end