/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
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
	-- RE:CB Beta 2/3
	VJ.AddNPC("Zombie (Male)","npc_vj_recb_zombie_male",vCat)
	VJ.AddNPC("Zombie (Female)","npc_vj_recb_zombie_female",vCat)
	VJ.AddNPC("Zombie (Soldier)","npc_vj_recb_zombie_soldier",vCat)
	VJ.AddNPC("Zombie (Priest)","npc_vj_recb_zombie_priest",vCat)	
	VJ.AddNPC("Zombie (Researcher)","npc_vj_recb_zombie_resear",vCat)	
	VJ.AddNPC("Zombie (Torso)","npc_vj_recb_zombie_torso",vCat)
	VJ.AddNPC("Crimson Head","npc_vj_recb_crimsonhead",vCat)
	VJ.AddNPC("Crimson Head (Researcher)","npc_vj_recb_crimsonhead_resear",vCat)	
	VJ.AddNPC("Cerberus","npc_vj_recb_cerberus",vCat)
	VJ.AddNPC("Cerberus (Beta 3)","npc_vj_recbb3_cerberus",vCat)	
	VJ.AddNPC("Tyrant-103","npc_vj_recb_tyrant",vCat)
	VJ.AddNPC("Proto-Tyrant","npc_vj_recb_prototyrant",vCat)
	VJ.AddNPC("Hunter","npc_vj_recb_hunter",vCat)
	VJ.AddNPC("Hunter (Beta 3)","npc_vj_recbb3_hunter",vCat)	
    VJ.AddNPC("Licker","npc_vj_recb_licker",vCat)
	VJ.AddNPC("Spider (Black Tiger)","npc_vj_recb_spider_blacktiger",vCat)
	VJ.AddNPC("Spider (Giant)","npc_vj_recb_spider_giant",vCat)
	VJ.AddNPC("Spider (Small)","npc_vj_recb_spider_small",vCat)	
	VJ.AddNPC("Spider (Baby)","npc_vj_recb_spider_baby",vCat)
	VJ.AddNPC("Crawler","npc_vj_recb_crawler",vCat)
	VJ.AddNPC("Snake","npc_vj_recb_snake",vCat)
	VJ.AddNPC("Ant","npc_vj_recb_ant",vCat)
	VJ.AddNPC("Flyclaw","npc_vj_recb_flyclaw",vCat)
	VJ.AddNPC("Pursuer","npc_vj_recb_pursuer",vCat)	
	VJ.AddNPC("Crow","npc_vj_recb_crow",vCat)
	VJ.AddNPC("Neptune","npc_vj_recb_neptune",vCat)
	
	-- RE:CB Beta 1
	VJ.AddNPC("Zombie (Male) (Beta 1)","npc_vj_recbb1_zombie_male",vCat)
	VJ.AddNPC("Zombie (Female) (Beta 1)","npc_vj_recbb1_zombie_female",vCat)
	VJ.AddNPC("Zombie (Hunk)","npc_vj_recbb1_zombie_hunk",vCat)
	VJ.AddNPC("Zombie (Torso) (Beta 1)","npc_vj_recbb1_zombie_torso",vCat)

    -- Spawners and Random	
	VJ.AddNPC("Random Zombie","sent_vj_recb_zom",vCat)
	VJ.AddNPC("Random Zombie Spawner","sent_vj_recb_zom_sp",vCat)
	VJ.AddNPC("Random Zombie Spawner (Single)","sent_vj_recb_zom_sinsp",vCat)	
	VJ.AddNPC("Random Monster","sent_vj_recb_mon",vCat)
	VJ.AddNPC("Random Monster Spawner","sent_vj_recb_mon_sp",vCat)
	VJ.AddNPC("Random Monster Spawner (Single)","sent_vj_recb_mon_sinsp",vCat)
	VJ.AddNPC("Monster Map Spawner","sent_vj_recb_mapspawner",vCat)
	
	-- Precache Models --
	util.PrecacheModel("models/vj_recb/ant_boss.mdl")
	util.PrecacheModel("models/vj_recb/babyspider.mdl")
	util.PrecacheModel("models/vj_recb/black_tiger.mdl")
	util.PrecacheModel("models/vj_recb/cerberus.mdl")
	util.PrecacheModel("models/vj_recb/crawler.mdl")
	util.PrecacheModel("models/vj_recb/crow.mdl")
	util.PrecacheModel("models/vj_recb/flyclaw.mdl")
	util.PrecacheModel("models/vj_recb/giantspider.mdl")
	util.PrecacheModel("models/vj_recb/hunter.mdl")
	util.PrecacheModel("models/vj_recb/licker.mdl")
	util.PrecacheModel("models/vj_recb/neptune.mdl")
	util.PrecacheModel("models/vj_recb/prototyrant.mdl")
	util.PrecacheModel("models/vj_recb/snake.mdl")
	util.PrecacheModel("models/vj_recb/tyrant_103.mdl")
	util.PrecacheModel("models/vj_recb/zombie_male.mdl")
	util.PrecacheModel("models/vj_recb/zombie_crimsonhead.mdl")
	util.PrecacheModel("models/vj_recb/zombie_female.mdl")
	util.PrecacheModel("models/vj_recb/zombie_soldier.mdl")
	util.PrecacheModel("models/vj_recb/zombie_torso.mdl")		
	util.PrecacheModel("models/vj_recb/zombie_female_beta.mdl")
	util.PrecacheModel("models/vj_recb/zombie_hunk.mdl")
	util.PrecacheModel("models/vj_recb/zombie_male_beta.mdl")		
	util.PrecacheModel("models/vj_recb/zombie_torso_beta.mdl")
	util.PrecacheModel("models/vj_recb/zombie_researcher.mdl")		
	util.PrecacheModel("models/vj_recb/zombie_priest.mdl")	
	util.PrecacheModel("models/vj_recb/zombie_crimsonhead_researcher.mdl")		
	util.PrecacheModel("models/vj_recb/giantspider_smaller.mdl")
	util.PrecacheModel("models/vj_recb/dog.mdl")		
	util.PrecacheModel("models/vj_recb/hunter_2.mdl")
	util.PrecacheModel("models/vj_recb/pursuer.mdl")
	
    -- Decals from HL1 --
    game.AddDecal("VJ_RECB_Blood_Red",{"vj_recb/decals/hl_blood01","vj_recb/decals/hl_blood02","vj_recb/decals/hl_blood03","vj_recb/decals/hl_blood04","vj_recb/decals/hl_blood05","vj_recb/decals/hl_blood06","vj_recb/decals/hl_blood07","vj_recb/decals/hl_blood08"})
    game.AddDecal("VJ_RECB_Blood_Red_Large",{"vj_recb/decals/hl_bigblood01","vj_recb/decals/hl_bigblood02"})
    game.AddDecal("VJ_RECB_Blood_Yellow",{"vj_recb/decals/hl_yblood01","vj_recb/decals/hl_yblood02","vj_recb/decals/hl_yblood03","vj_recb/decals/hl_yblood04","vj_recb/decals/hl_yblood05","vj_recb/decals/hl_yblood06"})
    game.AddDecal("VJ_RECB_Spit",{"vj_recb/decals/spit1_green","vj_recb/decals/spit2_green"})

    -- Particles by Dopey --
    game.AddParticles("particles/drg_re1_monster_effects.pcf")
    game.AddParticles("particles/drg_re2_fire_effects.pcf")
    PrecacheParticleSystem("drg_re2_fire_huge")
    PrecacheParticleSystem("drg_re2_fire_large")
    PrecacheParticleSystem("drg_re2_fire_medium")
    PrecacheParticleSystem("drg_re2_fire_small" )
    PrecacheParticleSystem("drg_re2_fire_tiny")
    PrecacheParticleSystem("drg_re1_blood_impact")
    PrecacheParticleSystem("drg_re1_blood_impact_large")
    PrecacheParticleSystem("drg_re1_blood_impact_acid")
    PrecacheParticleSystem( "drg_re1_blood_impact_green")
    PrecacheParticleSystem("drg_re1_blood_impact_plant")
    PrecacheParticleSystem("drg_re1_blood_impact_plant_small")
	
	-- Main ConVars --
	VJ.AddConVar("VJ_RECB_BossMusic", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_RECB_Gib", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_RECB_Dismember", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_RECB_Zombie_GetUpTime1", 5, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_RECB_Zombie_GetUpTime2", 10, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_RECB_Knocked", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_RECB_CerberusSleep", 0, {FCVAR_ARCHIVE})		
	
    -- Map Spawner ConVars --
    VJ.AddClientConVar("VJ_RECB_MapSpawner_Music", 1, {FCVAR_ARCHIVE})
    VJ.AddClientConVar("VJ_RECB_MapSpawner_Ambient", 1, {FCVAR_ARCHIVE})		
	VJ.AddClientConVar("VJ_RECB_MapSpawner_MusicVolume",50, {FCVAR_ARCHIVE})
	VJ.AddClientConVar("VJ_RECB_MapSpawner_AmbienceVolume",30, {FCVAR_ARCHIVE})		
	VJ.AddConVar("VJ_RECB_MapSpawner_Enabled", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_RECB_MapSpawner_MaxZom", 80, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_RECB_MapSpawner_HordeCount", 35, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_RECB_MapSpawner_SpawnMax", 2000, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_RECB_MapSpawner_SpawnMin", 650, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_RECB_MapSpawner_HordeChance", 100, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_RECB_MapSpawner_HordeCooldownMin", 120, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_RECB_MapSpawner_HordeCooldownMax", 180, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_RECB_MapSpawner_DelayMin", 0.85, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_RECB_MapSpawner_DelayMax", 3, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_RECB_MapSpawner_Zombies", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_RECB_MapSpawner_Misc", 0, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_RECB_MapSpawner_Specials", 0, {FCVAR_ARCHIVE})
		
      if CLIENT then
         hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_RECB", function()
		 spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "RECB (Main)", "RECB (Main)", "", "", function(Panel)
			if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
				Panel:AddControl("Label", {Text = "#vjbase.menu.general.admin.not"})
				Panel:AddControl( "Label", {Text = "#vjbase.menu.general.admin.only"})
    return
end
			Panel:AddControl( "Label", {Text = "#vjbase.menu.general.admin.only"})
			local vj_recbreset = {Options = {}, CVars = {}, Label = "Reset everything:", MenuButton = "0"}
			vj_recbreset.Options["#vjbase.menugeneral.default"] = { 
				VJ_RECB_BossMusic = "1",
				VJ_RECB_Gib = "1",
				VJ_RECB_Dismember = "1",
				VJ_RECB_Knocked = "1",
				VJ_RECB_CerberusSleep = "0",				
				VJ_RECB_Zombie_GetUpTime1 = "5",
				VJ_RECB_Zombie_GetUpTime2 = "10",				
}
            Panel:AddControl("ComboBox", vj_recbreset)		
            Panel:ControlHelp("Note: Only future spawned SNPCs will be affected.")
			Panel:AddControl( "Label", {Text = "Options:"})
            Panel:AddControl("Checkbox", {Label ="Enable Boss Music?", Command ="VJ_RECB_BossMusic"})
            Panel:AddControl("Checkbox", {Label ="Enable Cerberus Sleeping?", Command ="VJ_RECB_CerberusSleep"})
            Panel:AddControl("Checkbox", {Label ="Enable Zombies Being Knocked Down?", Command ="VJ_RECB_Knocked"})
            Panel:AddControl("Checkbox", {Label ="Enable Zombie Dismemberment?", Command ="VJ_RECB_Dismember"})
            Panel:AddControl("Checkbox", {Label ="Enable Gibbing?", Command ="VJ_RECB_Gib"})
            Panel:AddControl("Slider", {Label ="Zombie Getup Time Rand #1",Command ="VJ_RECB_Zombie_GetUpTime1", Min = "5", Max = "120"})
            Panel:AddControl("Slider", {Label ="Zombie Getup Time Rand #2",Command ="VJ_RECB_Zombie_GetUpTime2", Min = "5", Max = "120"})
            Panel:ControlHelp("Time until infected Players/(S)NPCs resurrect.")
			Panel:ControlHelp("Note: Rand #2 must be higher than Rand #1")
end)
		 spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "RECB (Map Spawner)", "RECB (Map Spawner)", "", "", function(Panel)
			local vj_recbreset_mapspawner_cs = {Options = {}, CVars = {}, Label = "Reset everything:", MenuButton = "0"}
			vj_recbreset_mapspawner_cs.Options["#vjbase.menugeneral.default"] = { 
			    VJ_RECB_MapSpawner_Music = "1",
			    VJ_RECB_MapSpawner_Ambient = "1",
			    VJ_RECB_MapSpawner_MusicVolume = "50",
			    VJ_RECB_MapSpawner_AmbienceVolume = "30",							
}
                Panel:AddControl("ComboBox", vj_recbreset_mapspawner_cs)
		 		Panel:AddControl( "Label", {Text = "Client-Side Options:"})
			    Panel:AddControl("Checkbox", {Label ="Enable Music?", Command ="VJ_RECB_MapSpawner_Music"})
			    Panel:AddControl("Checkbox", {Label ="Enable Ambience?", Command ="VJ_RECB_MapSpawner_Ambient"})	
				Panel:AddControl("Slider", { Label 	= "Music Volume", Command = "VJ_RECB_MapSpawner_MusicVolume", Type = "Float", Min = "10", Max = "100"})
				Panel:AddControl("Slider", { Label 	= "Ambience Volume", Command = "VJ_RECB_MapSpawner_AmbienceVolume", Type = "Float", Min = "10", Max = "100"})					
			if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
				Panel:AddControl("Label", {Text = "#vjbase.menu.general.admin.not"})
				Panel:AddControl( "Label", {Text = "#vjbase.menu.general.admin.only"})
    return
end
			Panel:AddControl( "Label", {Text = "#vjbase.menu.general.admin.only"})
			local vj_recbreset_mapspawner = {Options = {}, CVars = {}, Label = "Reset everything:", MenuButton = "0"}
			vj_recbreset_mapspawner.Options["#vjbase.menugeneral.default"] = { 				
				VJ_RECB_MapSpawner_Enabled = "1",
				VJ_RECB_MapSpawner_MaxZom = "80",	
				VJ_RECB_MapSpawner_HordeCount = "35",	
				VJ_RECB_MapSpawner_SpawnMax = "2000",	
				VJ_RECB_MapSpawner_SpawnMin = "650",	
				VJ_RECB_MapSpawner_HordeChance = "100",	
				VJ_RECB_MapSpawner_HordeCooldownMin = "120",	
				VJ_RECB_MapSpawner_HordeCooldownMax = "180",	
				VJ_RECB_MapSpawner_DelayMin = "0.85",
                VJ_RECB_MapSpawner_DelayMax = "3",				
			    VJ_RECB_MapSpawner_Zombies = "1",
				VJ_RECB_MapSpawner_Misc = "0",
				VJ_RECB_MapSpawner_Specials = "0"				
}
            Panel:AddControl("ComboBox", vj_recbreset_mapspawner)
			Panel:AddControl( "Label", {Text = "Options:"})		
            Panel:AddControl("Checkbox", {Label = "Enable Map Spawner processing?", Command = "VJ_RECB_MapSpawner_Enabled"})			
            Panel:AddControl("Checkbox", {Label ="Enable Normal Zombies?", Command ="VJ_RECB_MapSpawner_Zombies"})		
            Panel:AddControl("Checkbox", {Label ="Enable Misc Zombies?", Command ="VJ_RECB_MapSpawner_Misc"})
            Panel:AddControl("Checkbox", {Label ="Enable Special Zombies?", Command ="VJ_RECB_MapSpawner_Specials"})
			Panel:AddControl( "Label", {Text = "Modifiers:"})			
            Panel:AddControl("Slider", { Label 	= "Max Zombies", Command = "VJ_RECB_MapSpawner_MaxZom", Type = "Float", Min = "5", Max = "400"})
            Panel:AddControl("Slider", { Label 	= "Min Distance They Can Spawn From Players", Command = "VJ_RECB_MapSpawner_SpawnMin", Type = "Float", Min = "150", Max = "30000"})
            Panel:AddControl("Slider", { Label 	= "Max Distance They Can Spawn From Players", Command = "VJ_RECB_MapSpawner_SpawnMax", Type = "Float", Min = "150", Max = "30000"})
            Panel:AddControl("Slider", { Label 	= "Min Time Between Spawns", Command = "VJ_RECB_MapSpawner_DelayMin", Type = "Float", Min = "0.1", Max = "15"})
            Panel:AddControl("Slider", { Label 	= "Max Time Between Spawns", Command = "VJ_RECB_MapSpawner_DelayMax", Type = "Float", Min = "0.2", Max = "15"})
            Panel:AddControl("Slider", { Label 	= "Max Zombie Horde", Command = "VJ_RECB_MapSpawner_HordeCount", Type = "Float", Min = "5", Max = "400"})
            Panel:AddControl("Slider", { Label 	= "Chance That A Horde Will Appear", Command = "VJ_RECB_MapSpawner_HordeChance", Type = "Float", Min = "1", Max = "500"})
            Panel:AddControl("Slider", { Label 	= "Min Cooldown Time For Horde Spawns", Command = "VJ_RECB_MapSpawner_HordeCooldownMin", Type = "Float", Min = "1", Max = "800"})
            Panel:AddControl("Slider", { Label 	= "Max Cooldown Time For Horde Spawns", Command = "VJ_RECB_MapSpawner_HordeCooldownMax", Type = "Float", Min = "1", Max = "800"})
		end)	
    end)
end

	VJ_RECB_NODEPOS = {}
	hook.Add("EntityRemoved","VJ_RECB_AddNodes",function(ent)
		if ent:GetClass() == "info_node" then
			table.insert(VJ_RECB_NODEPOS,ent:GetPos())
	end
end)

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