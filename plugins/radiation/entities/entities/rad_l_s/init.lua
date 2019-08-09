AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')
local delayTime = 0
local range = 512
local radiationamount = 1
local geigerSounds = {"player/geiger1.wav", "player/geiger2.wav", "player/geiger3.wav" }

function ENT:SpawnFunction( ply, tr )
	if ( !tr.Hit ) then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	local ent = ents.Create( self.ClassName )
	ent:SetPos( SpawnPos )
	ent:Spawn()
	ent:Activate()
	return ent
end

function ENT:OnRemove()
end

function ENT:Initialize()

	self.Entity:SetModel( "models/props_junk/watermelon01.mdl" ) --Set its model.
	//self.Entity:PhysicsInit( SOLID_NONE )      -- Make us work with physics,
	self.Entity:SetMoveType( MOVETYPE_NONE )   -- after all, gmod is a physics
	self.Entity:SetSolid( SOLID_NONE ) 	-- Toolbox
	self.Entity:SetKeyValue("rendercolor", "150 255 150")
	self.Entity:SetKeyValue("renderamt", "0")
	self.Entity:SetMaterial("models/props_combine/portalball001_sheet")
	self.Entity:SetPersistent(true)
        local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end

function ENT:Think()
	if delayTime < CurTime() then
		delayTime = CurTime() + 0.2
		for k, v in pairs( ents.FindInSphere( self.Entity:GetPos(), 2560 )  ) do
			if v:IsPlayer() and v:IsValid() then
				local items = v:GetCharacter():GetInventory():GetItems(true)
				
				if v:GetPos( ):Distance( self:GetPos( ) ) <= range then
					if (!v:IsAdmin() and !v:GetMoveType() == MOVETYPE_NOCLIP) then
						if (v:GetCharacter():GetData("radiation") + radiationamount < 100) then
							v:AddRadiation(radiationamount)
						elseif (v:GetCharacter():GetData("radiation") + radiationamount >= 100) then
							v:SetRadiation(100)
						end
					else end
					
					local randomsound = table.Random(geigerSounds)
					v:EmitSound(randomsound)
				elseif v:GetPos( ):Distance( self:GetPos( ) ) <= range + 256 then					
					local randomsound = table.Random(geigerSounds)
					v:EmitSound(randomsound)
				end
			end
		end
	end
end

function ENT:Use( activator, caller, type, value )
end

function ENT:KeyValue( key, value )
end

function ENT:OnTakeDamage( dmginfo )
end

function ENT:StartTouch( entity )
end

function ENT:EndTouch( entity )
end

function ENT:Touch( entity )
end
