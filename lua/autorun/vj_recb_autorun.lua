------------------ Addon Information ------------------
local AddonName = "Resident Evil: Cold Blood SNPCs"
local AddonType = "NPC"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
    include("autorun/vj_controls.lua")

    VJ.AddCategoryInfo("Resident Evil: Cold Blood", {Icon = "vj_recb/icons/recb.png"})

    local spawnCategory = "Resident Evil: Cold Blood"

    -- Beta 1 --
    VJ.AddNPC("Cerberus (B1)","npc_vj_recbb1_cerberus",spawnCategory)
    VJ.AddNPC("Hunter (B1)","npc_vj_recbb1_hunter",spawnCategory)
    VJ.AddNPC("Zombie (Female) (B1)","npc_vj_recbb1_zombie_female",spawnCategory)
    VJ.AddNPC("Zombie (Hunk)","npc_vj_recbb1_zombie_hunk",spawnCategory)
    VJ.AddNPC("Zombie (Male) (B1)","npc_vj_recbb1_zombie_male",spawnCategory)
    VJ.AddNPC("Zombie (Torso) (B1)","npc_vj_recbb1_zombie_torso",spawnCategory)

    -- Beta 2 --
    VJ.AddNPC("Ant","npc_vj_recb_ant",spawnCategory)
    VJ.AddNPC("Cerberus","npc_vj_recb_cerberus",spawnCategory)
    VJ.AddNPC("Crawler","npc_vj_recb_crawler",spawnCategory)
    VJ.AddNPC("Crimson Head","npc_vj_recb_crimsonhead",spawnCategory)
    VJ.AddNPC("Crow","npc_vj_recb_crow",spawnCategory)
    VJ.AddNPC("Flyclaw","npc_vj_recb_flyclaw",spawnCategory)
    VJ.AddNPC("Hunter","npc_vj_recb_hunter",spawnCategory)
    VJ.AddNPC("Licker","npc_vj_recb_licker",spawnCategory)
    VJ.AddNPC("Neptune","npc_vj_recb_neptune",spawnCategory)
    VJ.AddNPC("Proto-Tyrant","npc_vj_recb_prototyrant",spawnCategory)
    VJ.AddNPC("Pursuer","npc_vj_recb_pursuer",spawnCategory)
    VJ.AddNPC("Snake","npc_vj_recb_snake",spawnCategory)
    VJ.AddNPC("Spider (Baby)","npc_vj_recb_spider_baby",spawnCategory)
    VJ.AddNPC("Spider (Black Tiger)","npc_vj_recb_spider_blacktiger",spawnCategory)
    VJ.AddNPC("Spider (Giant)","npc_vj_recb_spider_giant",spawnCategory)
    VJ.AddNPC("Tyrant-103","npc_vj_recb_tyrant",spawnCategory)
    VJ.AddNPC("Zombie (Female)","npc_vj_recb_zombie_female",spawnCategory)
    VJ.AddNPC("Zombie (Male)","npc_vj_recb_zombie_male",spawnCategory)
    VJ.AddNPC("Zombie (Soldier)","npc_vj_recb_zombie_soldier",spawnCategory)
    VJ.AddNPC("Zombie (Torso)","npc_vj_recb_zombie_torso",spawnCategory)

    -- Beta 3 --
    VJ.AddNPC("Cerberus (B3)","npc_vj_recbb3_cerberus",spawnCategory)
    VJ.AddNPC("Crimson Head (Researcher)","npc_vj_recb_crimsonhead_resear",spawnCategory)
    VJ.AddNPC("Hunter (B3)","npc_vj_recbb3_hunter",spawnCategory)
    VJ.AddNPC("Spider (Small)","npc_vj_recb_spider_small",spawnCategory)
    VJ.AddNPC("Zombie (Priest)","npc_vj_recb_zombie_priest",spawnCategory)
    VJ.AddNPC("Zombie (Researcher)","npc_vj_recb_zombie_resear",spawnCategory)

    -- Spawners and Random --
    VJ.AddNPC("Random Zombie","sent_vj_recb_zom",spawnCategory)
    VJ.AddNPC("Random Zombie Spawner","sent_vj_recb_zom_sp",spawnCategory)
    VJ.AddNPC("Random Zombie Spawner (Single)","sent_vj_recb_zom_sinsp",spawnCategory)
    VJ.AddNPC("Random Monster","sent_vj_recb_mon",spawnCategory)
    VJ.AddNPC("Random Monster Spawner","sent_vj_recb_mon_sp",spawnCategory)
    VJ.AddNPC("Random Monster Spawner (Single)","sent_vj_recb_mon_sinsp",spawnCategory)
    VJ.AddNPC("Monster Map Spawner","sent_vj_recb_mapspawner",spawnCategory)

    -- Precache Models --
    /*util.PrecacheModel("models/vj_recb/ant_boss.mdl")
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
    util.PrecacheModel("models/vj_recb/pursuer.mdl")*/

    -- Decals --
    game.AddDecal("VJ_RECB_Blood_Red",{"vj_recb/decals/blood01","vj_recb/decals/blood02","vj_recb/decals/blood03","vj_recb/decals/blood04","vj_recb/decals/blood05","vj_recb/decals/blood06","vj_recb/decals/blood07","vj_recb/decals/blood08"})
    game.AddDecal("VJ_RECB_Blood_Yellow",{"vj_recb/decals/yblood01","vj_recb/decals/yblood02","vj_recb/decals/yblood03","vj_recb/decals/yblood04","vj_recb/decals/yblood05","vj_recb/decals/yblood06"})
    game.AddDecal("VJ_RECB_Spider_Spit",{"vj_recb/decals/spit"})

    -- Particles --
    VJ.AddParticle("particles/vj_recb_particles.pcf", {
    "vj_recb_blood_red",
    "vj_recb_blood_red_large",
    "vj_recb_blood_boob_red",
    "vj_recb_blood_yellow",
    "vj_recb_blood_yellow_large",
    "vj_recb_blood_boob_yellow",
    "vj_recb_vomit",
    "vj_recb_spider_spit",
})

    -- Main ConVars --
    VJ.AddConVar("VJ_RECB_BossMusic", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_RECB_Gib", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_RECB_Dismember", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_RECB_Zombie_GetUpTime1", 5, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_RECB_Zombie_GetUpTime2", 10, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_RECB_Knocked", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_RECB_CerberusSleep", 0, {FCVAR_ARCHIVE})

    -- Map Spawner ConVars --
    VJ.AddClientConVar("VJ_RECB_MapSpawner_Music", 1, "Music For Map Spawner")
    VJ.AddClientConVar("VJ_RECB_MapSpawner_Ambient", 1, "Ambience For Map Spawner")
    VJ.AddClientConVar("VJ_RECB_MapSpawner_MusicVolume", 50, "Adjust Music Volume For Map Spawner")
    VJ.AddClientConVar("VJ_RECB_MapSpawner_AmbienceVolume", 30, "Adjust Ambience Volume For Map Spawner")
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
                Panel:AddControl("Slider", { Label     = "Music Volume", Command = "VJ_RECB_MapSpawner_MusicVolume", Type = "Float", Min = "10", Max = "100"})
                Panel:AddControl("Slider", { Label     = "Ambience Volume", Command = "VJ_RECB_MapSpawner_AmbienceVolume", Type = "Float", Min = "10", Max = "100"})
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
            Panel:AddControl("Slider", { Label     = "Max Zombies", Command = "VJ_RECB_MapSpawner_MaxZom", Type = "Float", Min = "5", Max = "400"})
            Panel:AddControl("Slider", { Label     = "Min Distance They Can Spawn From Players", Command = "VJ_RECB_MapSpawner_SpawnMin", Type = "Float", Min = "150", Max = "30000"})
            Panel:AddControl("Slider", { Label     = "Max Distance They Can Spawn From Players", Command = "VJ_RECB_MapSpawner_SpawnMax", Type = "Float", Min = "150", Max = "30000"})
            Panel:AddControl("Slider", { Label     = "Min Time Between Spawns", Command = "VJ_RECB_MapSpawner_DelayMin", Type = "Float", Min = "0.1", Max = "15"})
            Panel:AddControl("Slider", { Label     = "Max Time Between Spawns", Command = "VJ_RECB_MapSpawner_DelayMax", Type = "Float", Min = "0.2", Max = "15"})
            Panel:AddControl("Slider", { Label     = "Max Zombie Horde", Command = "VJ_RECB_MapSpawner_HordeCount", Type = "Float", Min = "5", Max = "400"})
            Panel:AddControl("Slider", { Label     = "Chance That A Horde Will Appear", Command = "VJ_RECB_MapSpawner_HordeChance", Type = "Float", Min = "1", Max = "500"})
            Panel:AddControl("Slider", { Label     = "Min Cooldown Time For Horde Spawns", Command = "VJ_RECB_MapSpawner_HordeCooldownMin", Type = "Float", Min = "1", Max = "800"})
            Panel:AddControl("Slider", { Label     = "Max Cooldown Time For Horde Spawns", Command = "VJ_RECB_MapSpawner_HordeCooldownMax", Type = "Float", Min = "1", Max = "800"})
        end)
    end)
end

    VJ_RECB_NODEPOS = {}
    hook.Add("EntityRemoved","VJ_RECB_AddNodes",function(ent)
        if ent:GetClass() == "info_node" then
            table.insert(VJ_RECB_NODEPOS,ent:GetPos())
    end
end)
---------------------------------------------------------------------------------------------------------------------------------------------
function VJ_RECB_DeathCode(ent)
    ent.HasBloodPool = false
    ent:AddFlags(FL_NOTARGET) -- So normal NPCs can stop shooting at the corpse
end
---------------------------------------------------------------------------------------------------------------------------------------------
function VJ_RECB_ApplyCorpse(ent,corpse)
 if !VJ_CVAR_AI_ENABLED then corpse:Remove() end
    //VJ_COFR_ExtraCorpseOptions(corpse)
    corpse:ResetSequence(ent:GetSequence())
    corpse:SetCycle(1)
    corpse:SetCollisionBounds(Vector(1, 1, 1), Vector(-1, -1, 0))
    corpse:SetSolid(SOLID_NONE)
    local bloodPool = ents.Create("prop_vj_animatable")
    bloodPool:SetModel("models/vj_recb/b3/blood.mdl")
    bloodPool:SetPos(corpse:GetPos())
    bloodPool:SetAngles(corpse:GetAngles())
    bloodPool:SetOwner(corpse)
    bloodPool:SetParent(corpse)
    bloodPool:SetCollisionGroup(COLLISION_GROUP_WEAPON)
    bloodPool:Spawn()
    bloodPool:Activate()
    bloodPool:SetSolid(SOLID_NONE)
    corpse:DeleteOnRemove(bloodPool)
end
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
    AddCSLuaFile(AutorunFile)
    VJ.AddAddonProperty(AddonName,AddonType)
else
    if CLIENT then
        chat.AddText(Color(0, 200, 200), PublicAddonName,
        Color(0, 255, 0), " was unable to install, you are missing ",
        Color(255, 100, 0), "VJ Base!")
    end

    timer.Simple(1, function()
        if not VJBASE_ERROR_MISSING then
            VJBASE_ERROR_MISSING = true
            if CLIENT then
                // Get rid of old error messages from addons running on older code...
                if VJF && type(VJF) == "Panel" then
                    VJF:Close()
                end
                VJF = true

                local frame = vgui.Create("DFrame")
                frame:SetSize(600, 160)
                frame:SetPos((ScrW() - frame:GetWide()) / 2, (ScrH() - frame:GetTall()) / 2)
                frame:SetTitle("Error: VJ Base is missing!")
                frame:SetBackgroundBlur(true)
                frame:MakePopup()

                local labelTitle = vgui.Create("DLabel", frame)
                labelTitle:SetPos(250, 30)
                labelTitle:SetText("VJ BASE IS MISSING!")
                labelTitle:SetTextColor(Color(255,128,128))
                labelTitle:SizeToContents()

                local label1 = vgui.Create("DLabel", frame)
                label1:SetPos(170, 50)
                label1:SetText("Garry's Mod was unable to find VJ Base in your files!")
                label1:SizeToContents()

                local label2 = vgui.Create("DLabel", frame)
                label2:SetPos(10, 70)
                label2:SetText("You have an addon installed that requires VJ Base but VJ Base is missing. To install VJ Base, click on the link below. Once\n                                                   installed, make sure it is enabled and then restart your game.")
                label2:SizeToContents()

                local link = vgui.Create("DLabelURL", frame)
                link:SetSize(300, 20)
                link:SetPos(195, 100)
                link:SetText("VJ_Base_Download_Link_(Steam_Workshop)")
                link:SetURL("https://steamcommunity.com/sharedfiles/filedetails/?id=131759821")

                local buttonClose = vgui.Create("DButton", frame)
                buttonClose:SetText("CLOSE")
                buttonClose:SetPos(260, 120)
                buttonClose:SetSize(80, 35)
                buttonClose.DoClick = function()
                    frame:Close()
                end
            elseif (SERVER) then
                VJF = true
                timer.Remove("VJBASEMissing")
                timer.Create("VJBASE_ERROR_CONFLICT", 5, 0, function()
                    print("VJ Base is missing! Download it from the Steam Workshop! Link: https://steamcommunity.com/sharedfiles/filedetails/?id=131759821")
                end)
            end
        end
    end)
end