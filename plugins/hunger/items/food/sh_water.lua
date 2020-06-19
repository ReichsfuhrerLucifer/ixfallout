ITEM.name = "Purified water"
ITEM.model = "models/mosi/fallout4/props/drink/water.mdl"
ITEM.description = "itemWaterDesc"
ITEM.price = 20
ITEM.thirst = 50

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 20, client:GetMaxHealth()))
end)