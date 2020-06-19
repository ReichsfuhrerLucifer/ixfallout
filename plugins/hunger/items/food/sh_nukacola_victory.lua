ITEM.name = "Nuka-Cola Victory"
ITEM.model = "models/mosi/fallout4/props/drink/nukacola2.mdl"
ITEM.skin = 2
ITEM.description = "itemNukaColaVictoryDesc"
ITEM.price = 40
ITEM.thirst = 25
ITEM.radiation = 15
ITEM.empty = "nukacola_bottle"

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 10, client:GetMaxHealth()))
	client:RestoreStamina(20)
	client:GetCharacter():GiveMoney(1)
end)