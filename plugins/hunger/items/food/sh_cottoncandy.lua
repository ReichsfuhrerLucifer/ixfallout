ITEM.name = "솜사탕"
ITEM.model = "models/mosi/fallout4/props/food/cottoncandy.mdl"
ITEM.description = "달달하고 맛있는 솜사탕입니다."
ITEM.price = 7
ITEM.hunger = 10
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)