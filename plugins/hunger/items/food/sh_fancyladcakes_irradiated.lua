ITEM.name = "Irr. Fancy Lads"
ITEM.model = "models/mosi/fallout4/props/food/fancyladcakes.mdl"
ITEM.description = "itemIrrFancyLadCakesDesc"
ITEM.price = 2
ITEM.hunger = 15
ITEM.radiation = 10

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)