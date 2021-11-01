AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_recb/black_tiger.mdl"} 
ENT.StartHealth = 1500
ENT.MeleeAttackDamage = 25
ENT.MeleeAttackDistance = 50 
ENT.MeleeAttackDamageDistance = 150
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(-40, 25, -25), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Joint 15", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_SoundTrack = {"vj_recb/mapspawner/spidersrevenge.wav"}
ENT.HasSoundTrack = true
ENT.SoundTrackLevel = 0.8
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
if GetConVarNumber("VJ_RECB_Boss_Music") == 0 then
        self.HasSoundTrack = false 
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize() 
	self:SetCollisionBounds(Vector(60, 60, 70), Vector(-60, -60, 0))
end
 ---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    if (dmginfo:IsBulletDamage()) then
	    dmginfo:ScaleDamage(0.25)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/