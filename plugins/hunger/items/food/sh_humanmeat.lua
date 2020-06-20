ITEM.name = "Human flesh"
ITEM.model = "models/mosi/fallout4/props/food/humanmeat.mdl"
ITEM.description = "itemHumanMeatDesc"
ITEM.price = 0
ITEM.skin = 1
ITEM.hunger = 60
ITEM.radiation = 10

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 25, client:GetMaxHealth()))
end)