ITEM.name = "Mole rat steak"
ITEM.model = "models/mosi/fallout4/props/food/moleratsteak.mdl"
ITEM.description = "itemMoleRatSteakDesc"
ITEM.price = 20
ITEM.hunger = 40
ITEM.radiation = 3

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 20, client:GetMaxHealth()))
end)