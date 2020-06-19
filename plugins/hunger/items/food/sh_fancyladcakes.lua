ITEM.name = "Fancy Lads Snack Cakes"
ITEM.model = "models/mosi/fallout4/props/food/fancyladcakes.mdl"
ITEM.description = "itemFancyLadCakesDesc"
ITEM.price = 5
ITEM.hunger = 15
ITEM.radiation = 3

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)