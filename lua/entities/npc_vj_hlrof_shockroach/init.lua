AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/opfor/shockroach.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.VJ_NPC_Class = {"CLASS_RACE_X"} -- NPCs with the same class with be allied to each other
ENT.MeleeAttackDamage = 10
ENT.StartHealth = 10
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_hlr/hl1_npc/shockroach/shock_walk.wav"}
ENT.SoundTbl_Idle = {"vj_hlr/hl1_npc/shockroach/shock_idle1.wav","vj_hlr/hl1_npc/shockroach/shock_idle2.wav","vj_hlr/hl1_npc/shockroach/shock_idle3.wav","vj_hlr/hl1_npc/shockroach/shock_idle1.wav","vj_hlr/hl1_npc/shockroach/shock_idle2.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/hl1_npc/shockroach/shock_angry.wav","vj_hlr/hl1_npc/shockroach/shock_angry.wav"}
ENT.SoundTbl_LeapAttackJump = {"vj_hlr/hl1_npc/shockroach/shock_jump1.wav","vj_hlr/hl1_npc/shockroach/shock_jump2.wav","vj_hlr/hl1_npc/shockroach/shock_jump1.wav"}
ENT.SoundTbl_LeapAttackDamage = {"vj_hlr/hl1_npc/shockroach/shock_bite.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/hl1_npc/shockroach/shock_flinch.wav","vj_hlr/hl1_npc/shockroach/shock_flinch.wav","vj_hlr/hl1_npc/shockroach/shock_flinch.wav"}
ENT.SoundTbl_Death = {"vj_hlr/hl1_npc/shockroach/shock_die.wav","vj_hlr/hl1_npc/shockroach/shock_die.wav"}

-- Custom --
ENT.Lifespan = false
ENT.Lifespan_Ended = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self.Dead == false && self.Lifespan == true then
		timer.Simple(15,function()
			if IsValid(self) then
				self.Lifespan_Ended = true
				self:TakeDamage(99999999999,self,self)
			end
		end)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/