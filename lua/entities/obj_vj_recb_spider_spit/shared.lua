ENT.Base 			= "obj_vj_projectile_base" -- Full list of bases is in the base, or go back to this link and read the list: https://saludos.sites.google.com/site/vrejgaming/makingvjbaseaddon
ENT.Type 			= "anim"
ENT.PrintName		= "Spider Spit"
ENT.Author 			= "Darkborn"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Information		= "Projectiles for my addons"
ENT.Category		= "Resident Evil: Cold Blood"

if (CLIENT) then
	local Name = "Spider Spit"
	local LangName = "obj_vj_recb_spider_spit"
	language.Add(LangName, Name)
	killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end