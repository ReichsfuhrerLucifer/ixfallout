ITEM.name = "Mutfruit"
ITEM.model = "models/mosi/fallout4/props/food/mutfruit.mdl"
ITEM.description = "itemMutfruitDesc"
ITEM.price = 5
ITEM.hunger = 20
ITEM.thirst = 10
ITEM.radiation = 3

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)