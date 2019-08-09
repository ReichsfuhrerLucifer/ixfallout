ITEM.name = "Alcohol"
ITEM.description = "Simple."
ITEM.category = "Alcohol"
ITEM.model = "models/props_lab/bindergraylabel01b.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.force = 0
ITEM.thirst = 0
ITEM.radiation = 0
ITEM.empty = false

ITEM.functions.drink = {
	icon = "icon16/drink.png",
	OnRun = function(item)
		local client = item.player
		local thirst = client:GetCharacter():GetData("thirst", 100)
		local radiation = client:GetCharacter():GetData("radiation", 0)
		
		if (thirst + item.thirst) >= 100 then
			client:SetThirst(100)
		elseif item.thirst > 0 then
			client:SetThirst(thirst + item.thirst)
		end
		
		if (radiation + item.radiation) >= 100 then
			client:SetRadiation(100)
		elseif item.thirst > 0 then
			client:SetRadiation(radiation + item.radiation)
		end
		
		client:GetCharacter():SetData("drunk", client:GetCharacter():GetData("drunk") + item.force)
		
		client:EmitSound( "npc/barnacle/barnacle_gulp2.wav" )
		hook.Run("Drunk", client)
		
		if item.empty then
			local inv = client:GetCharacter():GetInventory()
			inv:Add(item.empty)
		end
	end
}