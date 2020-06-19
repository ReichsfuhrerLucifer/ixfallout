ITEM.name = "Nuka-Cola Quartz"
ITEM.model = "models/mosi/fallout4/props/drink/nukacola.mdl"
ITEM.skin = 5
ITEM.description = "itemNukaColaQuartzDesc"
ITEM.price = 48
ITEM.thirst = 30
ITEM.radiation = 15
ITEM.empty = "nukacola_bottle"

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(20)
	client:GetCharacter():GiveMoney(1)
end)