ITEM.name = "Irr. YumYum D. Eggs"
ITEM.model = "models/mosi/fallout4/props/food/yumyumdeviledeggs.mdl"
ITEM.description = "itemIrrYumYumDEggsDesc"
ITEM.price = 3
ITEM.hunger = 10
ITEM.radiation = 10

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)