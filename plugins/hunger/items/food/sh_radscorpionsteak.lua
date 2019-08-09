ITEM.name = "라드스콜피온 스테이크"
ITEM.model = "models/mosi/fallout4/props/food/radscorpionsteak.mdl"
ITEM.description = "황무지에서 흔하게 볼 수 있는 생물인 라드스콜피온의 잘 조리된 고기입니다."
ITEM.price = 65
ITEM.hunger = 100
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)