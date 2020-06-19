ITEM.name = "Irr. Potato Crisps"
ITEM.model = "models/mosi/fallout4/props/food/potatocrisps.mdl"
ITEM.description = "itemIrrPotatoCrisps"
ITEM.price = 5
ITEM.hunger = 10
ITEM.thirst = -10
ITEM.radiation = 10

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)