ITEM.name = "Dirty water"
ITEM.model = "models/mosi/fallout4/props/drink/dirtywater.mdl"
ITEM.description = "itemDirtyWaterDesc"
ITEM.price = 10
ITEM.thirst = 50
ITEM.radiation = 6

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 10, client:GetMaxHealth()))
end)