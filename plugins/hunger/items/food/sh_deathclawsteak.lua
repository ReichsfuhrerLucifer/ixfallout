ITEM.name = "Deathclaw steak"
ITEM.model = "models/mosi/fallout4/props/food/deathclawmeat.mdl"
ITEM.skin = 1
ITEM.description = "itemDeathclawSteakDesc"
ITEM.price = 130
ITEM.hunger = 100

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)