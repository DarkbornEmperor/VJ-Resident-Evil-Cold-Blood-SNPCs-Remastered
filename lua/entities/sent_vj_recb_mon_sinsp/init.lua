AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/props_junk/popcan01a.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.EntitiesToSpawn = {
	{EntityName = "NPC1",SpawnPosition = {vForward=50,vRight=0,vUp=0},Entities = {"npc_vj_recb_zombie","npc_vj_recb_zombie_female","npc_vj_recb_zombie_soldier","npc_vj_recb_zombie_torso","npc_vj_recb_zombie","npc_vj_recb_zombie_female","npc_vj_recb_zombie_soldier","npc_vj_recb_zombie_torso","npc_vj_recb_crimsonhead","npc_vj_recb_cerberus","npc_vj_recb_hunter","npc_vj_recb_licker","npc_vj_recb_crawler","npc_vj_recb_snake","npc_vj_recb_flyclaw","npc_vj_recb_crow"}},

}
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/