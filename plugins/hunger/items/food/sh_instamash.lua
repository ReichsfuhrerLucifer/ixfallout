ITEM.name = "인스타 매쉬"
ITEM.model = "models/mosi/fallout4/props/food/instamash.mdl"
ITEM.description = "'감자를 캐내먹는 맛'이라는 캐치프레이즈를 가진 인스턴트 식품입니다."
ITEM.price = 5
ITEM.hunger = 25
ITEM.radiation = 2
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)