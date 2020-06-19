ITEM.name = "Preserved InstaMash"
ITEM.model = "models/mosi/fallout4/props/food/instamash.mdl"
ITEM.skin = 1
ITEM.description = "itemPrsvInstaMashDesc"
ITEM.price = 3
ITEM.hunger = 37

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)