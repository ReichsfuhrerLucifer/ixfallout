ITEM.name = "국수"
ITEM.model = "models/mosi/fallout4/props/food/noodles.mdl"
ITEM.description = "동양풍의 맛있는 국수 한 그릇입니다."
ITEM.price = 5
ITEM.hunger = 25
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)