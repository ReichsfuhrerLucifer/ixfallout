ITEM.name = "Nuka-Cola Orange"
ITEM.model = "models/mosi/fallout4/props/drink/nukacola.mdl"
ITEM.skin = 4
ITEM.description = "itemNukaColaOrangeDesc"
ITEM.price = 24
ITEM.thirst = 15
ITEM.empty = "nukacola_bottle"

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(15)
	client:GetCharacter():GiveMoney(1)
end)