ITEM.name = "블람코 마카로니 & 치즈"
ITEM.model = "models/mosi/fallout4/props/food/macandcheese.mdl"
ITEM.description = "마카로니 파스타에 치즈와 크림을 버무린 즉석 식품입니다."
ITEM.price = 5
ITEM.hunger = 20
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)