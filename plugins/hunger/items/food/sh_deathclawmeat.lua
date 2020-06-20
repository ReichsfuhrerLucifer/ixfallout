ITEM.name = "Deathclaw meat"
ITEM.model = "models/mosi/fallout4/props/food/deathclawmeat.mdl"
ITEM.description = "itemDeathclawMeatDesc"
ITEM.price = 110
ITEM.hunger = 90
ITEM.radiation = 6

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)