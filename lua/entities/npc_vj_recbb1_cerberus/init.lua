include("entities/npc_vj_recb_cerberus/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_recb/b1/cerberus.mdl"
ENT.HasLeapAttack = false
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -30),
    FirstP_Bone = "head",
    FirstP_Offset = Vector(0, 0, 5),
}
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
    if math.random(1,2) == 1 then
        self.SoundTbl_Alert = "vj_recb/cerberus/cer_bark.wav"
    else
        self.SoundTbl_Alert = "vj_recb/cerberus/cer_growl.wav"
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCallForHelp(ally) return end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/