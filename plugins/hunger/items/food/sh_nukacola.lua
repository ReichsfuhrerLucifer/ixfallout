ITEM.name = "Nuka-Cola"
ITEM.model = "models/mosi/fallout4/props/drink/nukacola.mdl"
ITEM.description = "itemNukaColaDesc"
ITEM.price = 20
ITEM.thirst = 10
ITEM.radiation = 3
ITEM.empty = "nukacola_bottle"

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(10)
	client:GetCharacter():GiveMoney(1)
end)