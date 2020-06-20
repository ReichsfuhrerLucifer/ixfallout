ITEM.name = "Human steak"
ITEM.model = "models/mosi/fallout4/props/food/humanmeat.mdl"
ITEM.description = "itemHumanSteakDesc"
ITEM.price = 0
ITEM.hunger = 60
ITEM.radiation = 3

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 25, client:GetMaxHealth()))
end)