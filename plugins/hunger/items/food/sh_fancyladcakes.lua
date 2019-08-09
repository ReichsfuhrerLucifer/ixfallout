ITEM.name = "팬시 라드 스낵 케이크"
ITEM.model = "models/mosi/fallout4/props/food/fancyladcakes.mdl"
ITEM.description = "한 입 먹을 때마다 큰 행복을 느낄 수 있다는 광고를 했던 전쟁 전 과자입니다."
ITEM.price = 5
ITEM.hunger = 15
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)