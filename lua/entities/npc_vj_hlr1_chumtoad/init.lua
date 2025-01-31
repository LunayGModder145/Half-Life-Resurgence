AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hl1/chumtoad.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 15
ENT.HullType = HULL_TINY
ENT.SightDistance = 250 -- How far it can see
ENT.MovementType = VJ_MOVETYPE_AQUATIC -- How does the SNPC move?
ENT.Aquatic_SwimmingSpeed_Calm = 80 -- The speed it should swim with, when it's wandering, moving slowly, etc. | Basically walking campared to ground SNPCs
ENT.Aquatic_SwimmingSpeed_Alerted = 80 -- The speed it should swim with, when it's chasing an enemy, moving away quickly, etc. | Basically running campared to ground SNPCs
ENT.Aquatic_AnimTbl_Calm = {ACT_SWIM} -- Animations it plays when it's wandering around while idle
ENT.Aquatic_AnimTbl_Alerted = {ACT_SWIM} -- Animations it plays when it's moving while alerted
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanOpenDoors = false -- Can it open doors?
ENT.Behavior = VJ_BEHAVIOR_PASSIVE -- The behavior of the SNPC
ENT.BloodColor = "Yellow" -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.CustomBlood_Decal = {"VJ_Blood_HL1_Yellow"} -- Decals to spawn when it's damaged
ENT.HasBloodPool = false -- Does it have a blood pool?
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {ACT_DIESIMPLE} -- Death Animations
ENT.DeathAnimationTime = false -- Time until the SNPC spawns its corpse and gets removed
	-- ====== Flinching Code ====== --
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH,ACT_BIG_FLINCH} -- If it uses normal based animation, use this
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Idle = {"vj_hlr/hl1_npc/chumtoad/toad_hunt1.wav","vj_hlr/hl1_npc/chumtoad/toad_hunt2.wav","vj_hlr/hl1_npc/chumtoad/toad_hunt3.wav","vj_hlr/hl1_npc/chumtoad/toad_deploy1.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/hl1_npc/chumtoad/toad_idle1.wav"}
ENT.SoundTbl_Death = {"vj_hlr/hl1_npc/chumtoad/toad_die1.wav"}

ENT.GeneralSoundPitch1 = 100

-- Custom
ENT.CT_BlinkingT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(9, 9, 15), Vector(-9, -9, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	if self:WaterLevel() == 0 then
		self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
		self.AnimTbl_IdleStand = {ACT_IDLE}
	else
		self:DoChangeMovementType(VJ_MOVETYPE_AQUATIC)
		self.AnimTbl_IdleStand = {ACT_SWIM}
	end
	
	if self.Dead == false && CurTime() > self.CT_BlinkingT then
		self:SetSkin(1)
		timer.Simple(0.15,function() if IsValid(self) then self:SetSkin(2) end end)
		timer.Simple(0.25,function() if IsValid(self) then self:SetSkin(1) end end)
		timer.Simple(0.4,function() if IsValid(self) then self:SetSkin(0) end end)
		self.CT_BlinkingT = CurTime() + math.Rand(2,3.5)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/