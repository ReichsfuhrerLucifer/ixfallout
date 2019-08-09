ITEM.name = "땅두더지 스테이크"
ITEM.model = "models/mosi/fallout4/props/food/moleratsteak.mdl"
ITEM.description = "황무지에서 흔하게 볼 수 있는 땅두더지의 잘 조리된 고기입니다."
ITEM.price = 20
ITEM.hunger = 40
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 20, client:GetMaxHealth()))
end)