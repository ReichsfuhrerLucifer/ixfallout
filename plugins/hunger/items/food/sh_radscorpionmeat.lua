ITEM.name = "Radscorpion meat"
ITEM.model = "models/mosi/fallout4/props/food/radscorpionmeat.mdl"
ITEM.description = "itemRadscorpionMeatDesc"
ITEM.price = 55
ITEM.hunger = 75
ITEM.radiation = 13

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)