ITEM.name = "Irradiated Cram"
ITEM.model = "models/mosi/fallout4/props/food/cram.mdl"
ITEM.description = "itemIrrCramDesc"
ITEM.price = 2
ITEM.hunger = 50
ITEM.radiation = 10

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)