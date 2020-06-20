ITEM.name = "Radscorpion steak"
ITEM.model = "models/mosi/fallout4/props/food/radscorpionsteak.mdl"
ITEM.description = "itemRadscorpionSteakDesc"
ITEM.price = 65
ITEM.hunger = 100

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)