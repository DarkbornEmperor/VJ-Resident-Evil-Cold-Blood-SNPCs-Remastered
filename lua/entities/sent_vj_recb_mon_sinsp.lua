/*--------------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base 			= "obj_vj_spawner_base"
ENT.Type 			= "anim"
ENT.PrintName 		= "Random Monster Spawner (Single)"
ENT.Author 			= "Darkborn"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose 		= "Spawn it and fight with it!"
ENT.Instructions 	= "Click on the spawnicon to spawn it."
ENT.Category		= "Resident Evil: Cold Blood"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

local entsList = {
	"npc_vj_recbb1_zombie_male:5",
	"npc_vj_recbb1_zombie_female:5",
	"npc_vj_recbb1_zombie_hunk:8",
	"npc_vj_recbb1_zombie_torso:6",	
	"npc_vj_recb_zombie_resear:3",
	"npc_vj_recb_zombie_priest:3",	
	"npc_vj_recb_zombie_male",
	"npc_vj_recb_zombie_female",
	"npc_vj_recb_zombie_torso:3",	
	"npc_vj_recb_zombie_soldier:8",	
	"npc_vj_recb_crimsonhead:15",
	"npc_vj_recb_crimsonhead_resear:15",	
	"npc_vj_recb_cerberus:10",
	"npc_vj_recb_hunter:15",
	"npc_vj_recb_licker:15",
	"npc_vj_recb_crawler:15",
	"npc_vj_recb_snake:10",
	"npc_vj_recb_flyclaw:15",
	"npc_vj_recb_crow:10",	
	"npc_vj_recb_spider_small:15",
	"npc_vj_recb_pursuer:15",
	"npc_vj_recbb3_hunter:15", 
	"npc_vj_recbb3_cerberus:15",	
	"npc_vj_recb_ant:15",
	"npc_vj_recb_spider_giant:20"		
}
ENT.EntitiesToSpawn = {
	{SpawnPosition = {vForward=20, vRight=0, vUp=0}, Entities = entsList},
}
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/