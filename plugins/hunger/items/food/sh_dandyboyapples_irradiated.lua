ITEM.name = "Irr. Dandy Boy Apples"
ITEM.model = "models/mosi/fallout4/props/food/dandyboyapples.mdl"
ITEM.description = "itemIrrDandyBoyApplesDesc"
ITEM.price = 5
ITEM.hunger = 15
ITEM.radiation = 10

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)