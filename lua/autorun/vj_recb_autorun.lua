/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
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

	-- ConVars --
	local AddConvars = {}
	AddConvars["VJ_RECB_Boss_Music"] = 1
	AddConvars["VJ_RECB_Gibbing"] = 1
	AddConvars["VJ_RECB_Dismember"] = 1	
	AddConvars["VJ_RECB_Zombie_GetUp_Time"] = 5
	AddConvars["VJ_RECB_Knocked"] = 1
	AddConvars["VJ_RECB_Cerberus_Sleep"] = 0
	
    -- Map Spawner ConVars --
    AddConvars["VJ_RECB_MapSpawner_Music"] = 1
	AddConvars["VJ_RECB_MapSpawner_Enabled"] = 1
	AddConvars["VJ_RECB_MapSpawner_Boss"] = 0
	AddConvars["VJ_RECB_MapSpawner_MaxMon"] = 80
	AddConvars["VJ_RECB_MapSpawner_HordeCount"] = 35
	AddConvars["VJ_RECB_MapSpawner_SpawnMax"] = 2000
	AddConvars["VJ_RECB_MapSpawner_SpawnMin"] = 650
	AddConvars["VJ_RECB_MapSpawner_HordeChance"] = 100
	AddConvars["VJ_RECB_MapSpawner_HordeCooldownMin"] = 120
	AddConvars["VJ_RECB_MapSpawner_HordeCooldownMax"] = 180
	AddConvars["VJ_RECB_MapSpawner_DelayMin"] = 0.85
	AddConvars["VJ_RECB_MapSpawner_DelayMax"] = 3
	
		for k, v in pairs(AddConvars) do
		if !ConVarExists( k ) then CreateConVar( k, v, {FCVAR_ARCHIVE} ) end
	end
	
if (CLIENT) then
local function VJ_RECB_MAIN(Panel)
			if !game.SinglePlayer() then
			if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
				Panel:AddControl( "Label", {Text = "You are not an admin!"})
				Panel:ControlHelp("Note: Only Admins Can Change These Settings!")
        return
	end
end
			Panel:AddControl( "Label", {Text = "Note: Only admins can change these settings!"})
			local vj_recbreset = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
			vj_recbreset.Options["#vjbase.menugeneral.default"] = { 
				VJ_RECB_Boss_Music = "1",
				VJ_RECB_Gibbing = "1", 
				VJ_RECB_Dismember = "1",				
				VJ_RECB_Zombie_GetUp_Time = "5",
				VJ_RECB_Knocked = "1",
				VJ_RECB_Cerberus_Sleep = "0",
}
           Panel:AddControl("ComboBox", vj_recbreset)
           Panel:ControlHelp("Note: Only future spawned SNPCs will be affected!")
           Panel:AddControl("Checkbox", {Label ="Enable boss music?", Command ="VJ_RECB_Boss_Music"})
           Panel:AddControl("Checkbox", {Label ="Enable gibbing?", Command ="VJ_RECB_Gibbing"})
           Panel:AddControl("Checkbox", {Label ="Enable dismemberment?", Command ="VJ_RECB_Dismember"})		   
           Panel:AddControl("Checkbox", {Label ="Enable sleeping for Cerberus?", Command ="VJ_RECB_Cerberus_Sleep"})
           Panel:AddControl("Checkbox", {Label ="Enable zombies being knocked down?", Command ="VJ_RECB_Knocked"})
           Panel:AddControl("Slider", {Label ="Time until zombies get up",Command ="VJ_RECB_Zombie_GetUp_Time",Min = "5",Max = "100"})
           Panel:AddPanel(typebox)

end
	function VJ_ADDTOMENU_RECB(Panel)
		spawnmenu.AddToolMenuOption("DrVrej","SNPC Configures","RE:CB (Main)","RE:CB (Main)","","", VJ_RECB_MAIN, {} )
end
		hook.Add("PopulateToolMenu","VJ_ADDTOMENU_RECB", VJ_ADDTOMENU_RECB )
		
    -- Map Spawner Configure Menu --
       local function VJ_RECB_MAPSPAWNER(Panel)
			if !game.SinglePlayer() then
			if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
				Panel:AddControl( "Label", {Text = "You are not an admin!"})
				Panel:ControlHelp("Note: Only admins can change these settings!")
        return
	end
end
			Panel:AddControl( "Label", {Text = "Note: Only admins can change these settings!"})
			local vj_recbreset_mapspawner = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
			vj_recbreset_mapspawner.Options["#vjbase.menugeneral.default"] = { 
			    VJ_RECB_MapSpawner_Music = "1",
				VJ_RECB_MapSpawner_Enabled = "1",
				VJ_RECB_MapSpawner_Boss = "0",
				VJ_RECB_MapSpawner_MaxMon = "80",	
				VJ_RECB_MapSpawner_HordeCount = "35",	
				VJ_RECB_MapSpawner_SpawnMax = "2000",	
				VJ_RECB_MapSpawner_SpawnMin = "650",	
				VJ_RECB_MapSpawner_HordeChance = "100",	
				VJ_RECB_MapSpawner_HordeCooldownMin = "120",	
				VJ_RECB_MapSpawner_HordeCooldownMax = "180",	
				VJ_RECB_MapSpawner_DelayMin = "0.85",
                VJ_RECB_MapSpawner_DelayMax = "3",				
}
            Panel:AddControl("ComboBox", vj_recbreset_mapspawner)
            Panel:AddControl("Checkbox", {Label ="Enable music?", Command ="VJ_RECB_MapSpawner_Music"})
            Panel:AddControl("Checkbox", {Label = "Enable Map Spawner processing?", Command = "VJ_RECB_MapSpawner_Enabled"})
            Panel:AddControl("Checkbox", {Label ="Enable bosses?", Command ="VJ_RECB_MapSpawner_Boss"})
            Panel:AddControl("Slider", { Label 	= "Max Monsters", Command = "VJ_RECB_MapSpawner_MaxMon", Type = "Float", Min = "5", Max = "400"})
            Panel:AddControl("Slider", { Label 	= "Min Distance they can spawn from players", Command = "VJ_RECB_MapSpawner_SpawnMin", Type = "Float", Min = "150", Max = "30000"})
            Panel:AddControl("Slider", { Label 	= "Max Distance they can spawn from players", Command = "VJ_RECB_MapSpawner_SpawnMax", Type = "Float", Min = "150", Max = "30000"})
            Panel:AddControl("Slider", { Label 	= "Min time between spawns", Command = "VJ_RECB_MapSpawner_DelayMin", Type = "Float", Min = "0.1", Max = "15"})
            Panel:AddControl("Slider", { Label 	= "Max time between spawns", Command = "VJ_RECB_MapSpawner_DelayMax", Type = "Float", Min = "0.2", Max = "15"})
            Panel:AddControl("Slider", { Label 	= "Max Monster horde", Command = "VJ_RECB_MapSpawner_HordeCount", Type = "Float", Min = "5", Max = "400"})
            Panel:AddControl("Slider", { Label 	= "Chance that a horde will appear", Command = "VJ_RECB_MapSpawner_HordeChance", Type = "Float", Min = "1", Max = "500"})
            Panel:AddControl("Slider", { Label 	= "Min cooldown time for horde spawns", Command = "VJ_RECB_MapSpawner_HordeCooldownMin", Type = "Float", Min = "1", Max = "800"})
            Panel:AddControl("Slider", { Label 	= "Max cooldown time for horde spawns", Command = "VJ_RECB_MapSpawner_HordeCooldownMax", Type = "Float", Min = "1", Max = "800"})
            Panel:AddPanel(typebox)
end
	function VJ_ADDTOMENU_RECB_MAPSPAWNER(Panel)
		spawnmenu.AddToolMenuOption("DrVrej","SNPC Configures","RE:CB (MapSp)","RE:CB (MapSp)","","", VJ_RECB_MAPSPAWNER, {} )
end
		hook.Add("PopulateToolMenu","VJ_ADDTOMENU_RECB_MAPSPAWNER", VJ_ADDTOMENU_RECB_MAPSPAWNER )
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