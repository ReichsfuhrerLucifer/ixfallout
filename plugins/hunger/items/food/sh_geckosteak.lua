ITEM.name = "겍코 스테이크"
ITEM.model = "models/mosi/fallout4/props/food/radroachsteak.mdl"
ITEM.description = "모하비 황무지에서 흔하게 볼 수 있는 생물인 겍코의 잘 조리된 고기입니다."
ITEM.price = 5
ITEM.hunger = 75
ITEM.radiation = 1
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)