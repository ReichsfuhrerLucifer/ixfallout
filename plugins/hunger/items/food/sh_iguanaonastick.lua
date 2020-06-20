ITEM.name = "Iguana-on-a-stick"
ITEM.model = "models/mosi/fallout4/props/food/iguanaonastick.mdl"
ITEM.description = "itemIguanaOnAStickDesc"
ITEM.price = 5
ITEM.hunger = 75
ITEM.radiation = 3

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)