ITEM.name = "Nuka-Cola Wild"
ITEM.model = "models/mosi/fallout4/props/drink/nukacola2.mdl"
ITEM.skin = 1
ITEM.description = "itemNukaColaWildDesc"
ITEM.price = 20
ITEM.thirst = 20
ITEM.radiation = 4
ITEM.empty = "nukacola_bottle"

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(10)
	client:GetCharacter():GiveMoney(1)
end)