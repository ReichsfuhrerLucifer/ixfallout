ENT.Type = "anim"
ENT.PrintName = "Paper"
ENT.Author = "Black Tea, Frosty"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Helix"

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/props_c17/paper01.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetNetVar("text", "")
		self:SetUseType(SIMPLE_USE)

		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:Wake()
		end
	end

	function ENT:Use(activator)
		activator:OpenNote( self:GetNetVar( "text" ), self, self:GetNetVar( "private" ) )
	end
else
	function ENT:Draw()
		self:DrawModel()
	end
end
