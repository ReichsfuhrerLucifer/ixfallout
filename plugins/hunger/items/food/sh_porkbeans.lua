ITEM.name = "Pork n' Beans"
ITEM.model = "models/mosi/fallout4/props/food/porknbeans.mdl"
ITEM.description = "itemPorkNBeansDesc"
ITEM.price = 5
ITEM.hunger = 40
ITEM.thirst = -20
ITEM.radiation = 3

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)