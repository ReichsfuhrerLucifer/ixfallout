ITEM.name = "Food base"
ITEM.description = "A food."
ITEM.model = "models/props_lab/bindergraylabel01b.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "consumables"
ITEM.hunger = 0
ITEM.thirst = 0
ITEM.radiation = 0
ITEM.empty = false
ITEM.functions.eat = {
	OnRun = function(item)
		local client = item.player
		local character = client:GetCharacter()
		local hunger = character:GetData("hunger", 100)
		local thirst = character:GetData("thirst", 100)
		local radiation = character:GetData("radiation", 0)
		
		if (hunger + item.hunger) >= 100 then
			client:SetHunger(100)	
		elseif item.hunger > 0 then
			client:SetHunger(hunger + item.hunger)
		end
		
		if (thirst + item.thirst) >= 100 then
			client:SetThirst(100)
		elseif item.thirst > 0 then
			client:SetThirst(thirst + item.thirst)
		end
		
		if (radiation + item.radiation) >= 100 then
			client:SetRadiation(100)
		elseif item.radiation > 0 then
			client:SetRadiation(radiation + item.radiation)
		end
		
		if item.empty then
			local inv = character:GetInventory()

			inv:Add(item.empty)
		end
	end,
	icon = "icon16/cup.png"
}