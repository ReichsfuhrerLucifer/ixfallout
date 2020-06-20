ITEM.name = "Deathclaw omelette"
ITEM.model = "models/mosi/fallout4/props/food/deathclawomelette.mdl"
ITEM.description = "itemDeathclawOmelette"
ITEM.price = 100
ITEM.hunger = 100

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 20, client:GetMaxHealth()))
end)