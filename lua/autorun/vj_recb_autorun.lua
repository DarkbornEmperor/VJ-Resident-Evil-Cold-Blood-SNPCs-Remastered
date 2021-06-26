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

    VJ.AddCategoryInfo("Resident Evil: Cold Blood", {Icon = "vj_recb/icons/recb.png"})

	local vCat = "Resident Evil: Cold Blood"
	-- RE:CB Beta 2
	VJ.AddNPC("Zombie (Male)","npc_vj_recb_zombie_male",vCat)
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
	-- RE:CB Beta 1
	VJ.AddNPC("(Beta) Zombie (Male)","npc_vj_recbb1_zombie_male",vCat)
	VJ.AddNPC("(Beta) Zombie (Female)","npc_vj_recbb1_zombie_female",vCat)
	VJ.AddNPC("(Beta) Zombie (Hunk)","npc_vj_recbb1_zombie_hunk",vCat)
	VJ.AddNPC("(Beta) Zombie (Torso)","npc_vj_recbb1_zombie_torso",vCat)

    -- Spawners and Random	
	VJ.AddNPC("Random Zombie","sent_vj_recb_zom",vCat)
	VJ.AddNPC("Random Zombie Spawner","sent_vj_recb_zom_sp",vCat)
	VJ.AddNPC("Random Zombie Spawner (Single)","sent_vj_recb_zom_sinsp",vCat)	
	VJ.AddNPC("Random Monster","sent_vj_recb_mon",vCat)
	VJ.AddNPC("Random Monster Spawner","sent_vj_recb_mon_sp",vCat)
	VJ.AddNPC("Random Monster Spawner (Single)","sent_vj_recb_mon_sinsp",vCat)
	VJ.AddNPC("Monster Map Spawner","sent_vj_recb_mapspawner",vCat)
	
	-- Precache Models --
	util.PrecacheModel("models/vj_recb/recb_ant_boss.mdl")
	util.PrecacheModel("models/vj_recb/recb_babyspider.mdl")
	util.PrecacheModel("models/vj_recb/recb_black_tiger.mdl")
	util.PrecacheModel("models/vj_recb/recb_cerberus.mdl")
	util.PrecacheModel("models/vj_recb/recb_crawler.mdl")
	util.PrecacheModel("models/vj_recb/recb_crow.mdl")
	util.PrecacheModel("models/vj_recb/recb_flyclaw.mdl")
	util.PrecacheModel("models/vj_recb/recb_giantspider.mdl")
	util.PrecacheModel("models/vj_recb/recb_hunter.mdl")
	util.PrecacheModel("models/vj_recb/recb_licker.mdl")
	util.PrecacheModel("models/vj_recb/recb_neptune.mdl")
	util.PrecacheModel("models/vj_recb/recb_prototyrant.mdl")
	util.PrecacheModel("models/vj_recb/recb_snake.mdl")
	util.PrecacheModel("models/vj_recb/recb_tyrant_103.mdl")
	util.PrecacheModel("models/vj_recb/recb_zombie_male.mdl")
	util.PrecacheModel("models/vj_recb/recb_zombie_crimsonhead.mdl")
	util.PrecacheModel("models/vj_recb/recb_zombie_female.mdl")
	util.PrecacheModel("models/vj_recb/recb_zombie_soldier.mdl")
	util.PrecacheModel("models/vj_recb/recb_zombie_torso.mdl")		
	util.PrecacheModel("models/vj_recb/recb_zombie_female_beta.mdl")
	util.PrecacheModel("models/vj_recb/recb_zombie_hunk.mdl")
	util.PrecacheModel("models/vj_recb/recb_zombie_male_beta.mdl")		
	util.PrecacheModel("models/vj_recb/recb_zombie_torso_beta.mdl")	

    -- Decals from HL1 --
    game.AddDecal("VJ_RECB_Blood_Red",{"vj_hl/decals/hl_blood01","vj_hl/decals/hl_blood02","vj_hl/decals/hl_blood03","vj_hl/decals/hl_blood04","vj_hl/decals/hl_blood05","vj_hl/decals/hl_blood06","vj_hl/decals/hl_blood07","vj_hl/decals/hl_blood08"})
    game.AddDecal("VJ_RECB_Blood_Red_Large",{"vj_hl/decals/hl_bigblood01","vj_hl/decals/hl_bigblood02"})
    game.AddDecal("VJ_RECB_Blood_Yellow",{"vj_hl/decals/hl_yblood01","vj_hl/decals/hl_yblood02","vj_hl/decals/hl_yblood03","vj_hl/decals/hl_yblood04","vj_hl/decals/hl_yblood05","vj_hl/decals/hl_yblood06"})

    -- Particles by Dopey --
    game.AddParticles( "particles/drg_re1_monster_effects.pcf" )
    game.AddParticles( "particles/drg_re2_fire_effects.pcf" )
    PrecacheParticleSystem( "drg_re2_fire_huge" )
    PrecacheParticleSystem( "drg_re2_fire_large" )
    PrecacheParticleSystem( "drg_re2_fire_medium" )
    PrecacheParticleSystem( "drg_re2_fire_small" )
    --PrecacheParticleSystem( "drg_re2_fire_tiny" )
    PrecacheParticleSystem( "drg_re1_blood_impact" )
    PrecacheParticleSystem( "drg_re1_blood_impact_large" )
    PrecacheParticleSystem( "drg_re1_blood_impact_acid" )
    PrecacheParticleSystem( "drg_re1_blood_impact_green" )
    --PrecacheParticleSystem( "drg_re1_blood_impact_plant" )
    --PrecacheParticleSystem( "drg_re1_blood_impact_plant_small" )

	-- ConVars --
	local AddConvars = {}
	AddConvars["VJ_RECB_Boss_Music"] = 1
	AddConvars["VJ_RECB_Gibbing"] = 1
	AddConvars["VJ_RECB_Zombie_GetUp_Time"] = 5
	AddConvars["VJ_RECB_Knocked"] = 1
	AddConvars["VJ_RECB_Cerberus_Sleep"] = 1
	
    -- Map Spawner ConVars --
    AddConvars["VJ_RECB_MapSpawner_Music"] = 1
	AddConvars["VJ_RECB_MapSpawner_Boss"] = 0
	
		for k, v in pairs(AddConvars) do
		if !ConVarExists( k ) then CreateConVar( k, v, {FCVAR_ARCHIVE} ) end
	end
	
if (CLIENT) then
local function VJ_RECB_MAIN(Panel)
			if !game.SinglePlayer() then
			if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
				Panel:AddControl( "Label", {Text = "You Are Not An Admin!"})
				Panel:ControlHelp("Note: Only Admins Can Change These Settings!")
return
	end
end
			Panel:AddControl( "Label", {Text = "Note: Only Admins Can Change These Settings!"})
			local vj_recbreset = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
			vj_recbreset.Options["#vjbase.menugeneral.default"] = { 
				VJ_RECB_Boss_Music = "1",
				VJ_RECB_Gibbing = "1",
				VJ_RECB_Zombie_GetUp_Time = "5",
				VJ_RECB_Knocked = "1",
				VJ_RECB_Cerberus_Sleep = "1",
}
Panel:AddControl("ComboBox", vj_recbreset)
Panel:ControlHelp("NOTE: Only Future Spawned SNPCs Will Be Affected!")
Panel:AddControl("Checkbox", {Label ="Bosses Have Music?", Command ="VJ_RECB_Boss_Music"})
Panel:AddControl("Checkbox", {Label ="SNPCs Can Gib?", Command ="VJ_RECB_Gibbing"})
Panel:AddControl("Checkbox", {Label ="Cerberus Can Sleep?", Command ="VJ_RECB_Cerberus_Sleep"})
Panel:AddControl("Checkbox", {Label ="Zombies Can Be Knocked Down?", Command ="VJ_RECB_Knocked"})
Panel:AddControl("Slider", {Label ="Time Until Zombies Get Back Up",Command ="VJ_RECB_Zombie_GetUp_Time",Min = "5",Max = "100"})
Panel:AddPanel(typebox)

end
	function VJ_ADDTOMENU_RECB(Panel)
		spawnmenu.AddToolMenuOption("DrVrej","SNPC Configures","RE:CB","RE:CB","","", VJ_RECB_MAIN, {} )
end
		hook.Add("PopulateToolMenu","VJ_ADDTOMENU_RECB", VJ_ADDTOMENU_RECB )
end

if (CLIENT) then
local function VJ_RECB_MAPSPAWNER(Panel)
			if !game.SinglePlayer() then
			if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
				Panel:AddControl( "Label", {Text = "You Are Not An Admin!"})
				Panel:ControlHelp("Note: Only Admins Can Change These Settings!")
return
	end
end
			Panel:AddControl( "Label", {Text = "Note: Only Admins Can Change These Settings!"})
			local vj_recbreset_mapspawner = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
			vj_recbreset_mapspawner.Options["#vjbase.menugeneral.default"] = { 
			    VJ_RECB_MapSpawner_Music = "1",
				VJ_RECB_MapSpawner_Boss = "0",			

}
Panel:AddControl("ComboBox", vj_recbreset_mapspawner)
Panel:ControlHelp("NOTE: Only Admins Can Change These Settings!")
Panel:AddControl("Checkbox", {Label ="Enable Music?", Command ="VJ_RECB_MapSpawner_Music"})
Panel:AddControl("Checkbox", {Label ="Enable Bosses?", Command ="VJ_RECB_MapSpawner_Boss"})
Panel:AddPanel(typebox)

end
	function VJ_ADDTOMENU_RECB_MAPSPAWNER(Panel)
		spawnmenu.AddToolMenuOption("DrVrej","SNPC Configures","RE:CB Map Spawner","RE:CB Map Spawner","","", VJ_RECB_MAPSPAWNER, {} )
end
		hook.Add("PopulateToolMenu","VJ_ADDTOMENU_RECB_MAPSPAWNER", VJ_ADDTOMENU_RECB_MAPSPAWNER )
end

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