ITEM.name = "Ice cold Nuka-Cola Quantom"
ITEM.model = "models/mosi/fallout4/props/drink/nukacola2.mdl"
ITEM.description = "itemNukaColaQuantomColdDesc"
ITEM.price = 30
ITEM.thirst = 10
ITEM.radiation = 5
ITEM.empty = "nukacola_bottle"

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(30)
	client:GetCharacter():GiveMoney(1)
end)