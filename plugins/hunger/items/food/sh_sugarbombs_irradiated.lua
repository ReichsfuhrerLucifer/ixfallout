ITEM.name = "Irr. Sugar Bombs"
ITEM.model = "models/mosi/fallout4/props/food/sugarbombs.mdl"
ITEM.description = "itemIrrSugarBombsDesc"
ITEM.price = 3
ITEM.hunger = 30
ITEM.radiation = 10

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)