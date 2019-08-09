ITEM.name = "레이저그레인"
ITEM.model = "models/mosi/fallout4/props/food/razorgrain.mdl"
ITEM.description = "황무지의 끔찍한 조건에서는 도저히 재배할 수 없는 밀을 대체할 만한 신작물입니다."
ITEM.price = 5
ITEM.hunger = 10
ITEM.radiation = 2
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)