ITEM.name = "Food base"
ITEM.description = "A food."
ITEM.model = "models/props_lab/bindergraylabel01b.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.hunger = 0
ITEM.thirst = 0
ITEM.radiation = 0
ITEM.category = "consumables"
ITEM.empty = false
ITEM.functions.eat = {
	OnRun = function(item)
		local hunger = item.player:GetCharacter():GetData("hunger", 100)
		local thirst = item.player:GetCharacter():GetData("thirst", 100)
		local radiation = item.player:GetCharacter():GetData("radiation", 0)
		local client = item.player
		
		if (hunger + item.hunger) >= 100 then
			item.player:SetHunger(100)	
		elseif item.hunger > 0 then
			item.player:SetHunger(hunger + item.hunger)
		end
		
		if (thirst + item.thirst) >= 100 then
			item.player:SetThirst(100)
		elseif item.thirst > 0 then
			item.player:SetThirst(thirst + item.thirst)
		end
		
		if (radiation + item.radiation) >= 100 then
			item.player:SetRadiation(100)
		elseif item.radiation > 0 then
			item.player:SetRadiation(radiation + item.radiation)
		end
		
		if item.empty then
			local inv = item.player:GetCharacter():GetInventory()
			inv:Add(item.empty)
		end
	end,
	icon = "icon16/cup.png"
}