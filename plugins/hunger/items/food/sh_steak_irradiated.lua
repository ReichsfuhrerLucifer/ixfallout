ITEM.name = "오염된 솔즈베리 스테이크"
ITEM.model = "models/mosi/fallout4/props/food/salisburysteak.mdl"
ITEM.description = "전자레인지에 돌려 먹는 간편 쇠고기 스테이크입니다.\n방사능에 오염되어 있습니다."
ITEM.price = 3
ITEM.hunger = 15
ITEM.radiation = 10
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)