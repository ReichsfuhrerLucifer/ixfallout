ITEM.name = "InstaMash"
ITEM.model = "models/mosi/fallout4/props/food/instamash.mdl"
ITEM.description = "itemInstaMashDesc"
ITEM.price = 5
ITEM.hunger = 25
ITEM.radiation = 2

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)