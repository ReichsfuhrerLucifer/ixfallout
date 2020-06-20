ITEM.name = "Mirelurk egg"
ITEM.model = "models/mosi/fallout4/props/food/mirelurkegg.mdl"
ITEM.description = "itemMirelurkEggDesc"
ITEM.price = 0
ITEM.hunger = 9
ITEM.thirst = 20
ITEM.radiation = 12

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)