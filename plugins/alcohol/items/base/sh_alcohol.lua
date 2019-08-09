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

ITEM.functions.use = {
	name  = "마시기",
	icon = "icon16/drink.png",
	OnRun = function(item)
		local client = item.player
		local thirst = item.player:GetCharacter():GetData("thirst", 100)
		local radiation = item.player:GetCharacter():GetData("radiation", 0)
		
		if (thirst + item.thirst) >= 100 then
			item.player:SetThirst(100)
		elseif item.thirst > 0 then
			item.player:SetThirst(thirst + item.thirst)
		end
		
		if (radiation + item.radiation) >= 100 then
			item.player:SetRadiation(100)
		elseif item.thirst > 0 then
			item.player:SetRadiation(radiation + item.radiation)
		end
		
		client:GetCharacter():SetData("drunk", client:GetCharacter():GetData("drunk") + item.force)
		
		client:EmitSound( "npc/barnacle/barnacle_gulp2.wav" )
		hook.Run("Drunk", client)
		
		if item.empty then
			local inv = item.player:GetCharacter():GetInventory()
			inv:Add(item.empty)
		end
	end
}