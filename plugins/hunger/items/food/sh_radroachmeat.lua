ITEM.name = "라드로치 고기"
ITEM.model = "models/mosi/fallout4/props/food/radroachmeat.mdl"
ITEM.description = "황무지에서 흔하게 볼 수 있는 거대 바퀴벌레인 라드로치의 고기입니다."
ITEM.price = 2
ITEM.hunger = 25
ITEM.radiation = 10
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)