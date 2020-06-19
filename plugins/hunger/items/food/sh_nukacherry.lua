ITEM.name = "Nuka-Cherry"
ITEM.model = "models/mosi/fallout4/props/drink/nukacola.mdl"
ITEM.skin = 2
ITEM.description = "itemNukaCherryDesc"
ITEM.price = 40
ITEM.thirst = 15
ITEM.radiation = 3
ITEM.empty = "nukacola_bottle"

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(15)
	client:GetCharacter():GiveMoney(1)
end)