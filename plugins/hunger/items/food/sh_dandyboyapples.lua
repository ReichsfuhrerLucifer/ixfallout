ITEM.name = "Dandy Boy Apples"
ITEM.model = "models/mosi/fallout4/props/food/dandyboyapples.mdl"
ITEM.description = "itemDandyBoyApplesDesc"
ITEM.price = 5
ITEM.hunger = 15
ITEM.radiation = 3

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)