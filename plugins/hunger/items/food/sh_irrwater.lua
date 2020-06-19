ITEM.name = "Irradiated water"
ITEM.model = "models/mosi/fallout4/props/drink/dirtywater.mdl"
ITEM.description = "itemIrrWaterDesc"
ITEM.price = 5
ITEM.thirst = 50
ITEM.radiation = 16

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 10, client:GetMaxHealth()))
end)