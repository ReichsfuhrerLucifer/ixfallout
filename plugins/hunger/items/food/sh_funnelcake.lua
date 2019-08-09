ITEM.name = "퍼넬 케이크"
ITEM.model = "models/mosi/fallout4/props/food/funnelcake.mdl"
ITEM.description = "햄버거와 감자 튀김 다음으로 미국을 대표하는 음식으로 알려진 디저트로, 보통 축제나 파티에서 많이 먹었습니다."
ITEM.price = 18
ITEM.hunger = 10
ITEM.radiation = 4
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)