/*--------------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
    VJ.AddPlugin("Resident Evil: Cold Blood SNPCs", "NPC")

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
         spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "RECB - General", "RECB - General", "", "", function(panel)
            if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
                panel:Help("#vjbase.menu.general.admin.not")
                panel:Help("#vjbase.menu.general.admin.only"})
    return
end
            panel:Help("#vjbase.menu.general.admin.only"})
            local vj_recbreset = {Options = {}, CVars = {}, Label = "Reset everything:", MenuButton = "0"}
            vj_recbreset.Options["#vjbase.menu.general.reset.everything"] = {
                VJ_RECB_BossMusic = "1",
                VJ_RECB_Gib = "1",
                VJ_RECB_Dismember = "1",
                VJ_RECB_Knocked = "1",
                VJ_RECB_CerberusSleep = "0",
                VJ_RECB_Zombie_GetUpTime1 = "5",
                VJ_RECB_Zombie_GetUpTime2 = "10",
}
            panel:AddControl("ComboBox", vj_recbreset)
            panel:ControlHelp("Note: Only future spawned SNPCs will be affected.")
            panel:Help("Options:")
            panel:CheckBox("Enable Boss Music?","VJ_RECB_BossMusic")
            panel:CheckBox("Enable Cerberus Sleeping?","VJ_RECB_CerberusSleep")
            panel:CheckBox("Enable Zombies Being Knocked Down?","VJ_RECB_Knocked")
            panel:CheckBox("Enable Zombie Dismemberment?","VJ_RECB_Dismember")
            panel:CheckBox("Enable Gibbing?","VJ_RECB_Gib")
            panel:CheckBox("Zombie Getup Time Rand #1","VJ_RECB_Zombie_GetUpTime1","5","120")
            panel:CheckBox("Zombie Getup Time Rand #2","VJ_RECB_Zombie_GetUpTime2","5","120")
            panel:ControlHelp("Time until infected Players/(S)NPCs resurrect.")
            panel:ControlHelp("Note: Rand #2 must be higher than Rand #1")
end)
         spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "RECB - Map Spawner", "RECB - Map Spawner", "", "", function(panel)
            local vj_recbreset_mapspawner_cs = {Options = {}, CVars = {}, Label = "Reset everything:", MenuButton = "0"}
            vj_recbreset_mapspawner_cs.Options["#vjbase.menu.general.reset.everything"] = {
                VJ_RECB_MapSpawner_Music = "1",
                VJ_RECB_MapSpawner_Ambient = "1",
                VJ_RECB_MapSpawner_MusicVolume = "50",
                VJ_RECB_MapSpawner_AmbienceVolume = "30"
}
                panel:AddControl("ComboBox", vj_recbreset_mapspawner_cs)
                 panel:Help("Client-Side Options:")
                panel:CheckBox("Enable Music?","VJ_RECB_MapSpawner_Music")
                panel:CheckBox("Enable Ambience?","VJ_RECB_MapSpawner_Ambient")
                panel:CheckBox("Music Volume","VJ_RECB_MapSpawner_MusicVolume",10,100,2)
                panel:CheckBox("Ambience Volume","VJ_RECB_MapSpawner_AmbienceVolume",10,100,2)
            if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
                panel:Help("#vjbase.menu.general.admin.not")
                panel:Help("#vjbase.menu.general.admin.only")
    return
end
            panel:Help("#vjbase.menu.general.admin.only")
            local vj_recbreset_mapspawner = {Options = {}, CVars = {}, Label = "Reset everything:", MenuButton = "0"}
            vj_recbreset_mapspawner.Options["#vjbase.menu.general.reset.everything"] = {
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
            panel:AddControl("ComboBox", vj_recbreset_mapspawner)
            panel:Help("Options:")
            panel:CheckBox("Enable Map Spawner processing?","VJ_RECB_MapSpawner_Enabled")
            panel:CheckBox("Enable Normal Zombies?","VJ_RECB_MapSpawner_Zombies")
            panel:CheckBox("Enable Misc Zombies?","VJ_RECB_MapSpawner_Misc")
            panel:CheckBox("Enable Special Zombies?","VJ_RECB_MapSpawner_Specials")
            panel:Help("Modifiers:")
            panel:NumSlider("Max Zombies","VJ_RECB_MapSpawner_MaxZom",5,400,2)
            panel:NumSlider("Min Distance They Can Spawn From Players","VJ_RECB_MapSpawner_SpawnMin",150,30000,2)
            panel:NumSlider("Max Distance They Can Spawn From Players","VJ_RECB_MapSpawner_SpawnMax",150,30000,2)
            panel:NumSlider("Min Time Between Spawns","VJ_RECB_MapSpawner_DelayMin",0.1,15,2)
            panel:NumSlider("Max Time Between Spawns","VJ_RECB_MapSpawner_DelayMax",0.2,15,2)
            panel:NumSlider("Max Zombie Horde","VJ_RECB_MapSpawner_HordeCount",5,400,2)
            panel:NumSlider("Chance That A Horde Will Appear","VJ_RECB_MapSpawner_HordeChance",1,500,2)
            panel:NumSlider("Min Cooldown Time For Horde Spawns","VJ_RECB_MapSpawner_HordeCooldownMin",1,800,2)
            panel:NumSlider("Max Cooldown Time For Horde Spawns","VJ_RECB_MapSpawner_HordeCooldownMax",1,800,2)
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