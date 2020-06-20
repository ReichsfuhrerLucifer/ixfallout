ITEM.name = "Carrot"
ITEM.model = "models/mosi/fallout4/props/food/carrot.mdl"
ITEM.description = "itemCarrotDesc"
ITEM.price = 3
ITEM.hunger = 10
ITEM.radiation = 3

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)