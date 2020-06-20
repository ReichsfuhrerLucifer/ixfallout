ITEM.name = "Gecko steak"
ITEM.model = "models/mosi/fallout4/props/food/radroachsteak.mdl"
ITEM.description = "itemGeckoSteakDesc"
ITEM.price = 5
ITEM.hunger = 75
ITEM.radiation = 1

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)