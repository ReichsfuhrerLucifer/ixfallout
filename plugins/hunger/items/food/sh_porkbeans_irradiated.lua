ITEM.name = "Irr. Pork n' Beans"
ITEM.model = "models/mosi/fallout4/props/food/porknbeans.mdl"
ITEM.description = "itemIrrPorkNBeansDesc"
ITEM.price = 2
ITEM.hunger = 40
ITEM.thirst = -20
ITEM.radiation = 10

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)