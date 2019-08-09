ITEM.name = "오염된 댄디보이 애플"
ITEM.model = "models/mosi/fallout4/props/food/dandyboyapples.mdl"
ITEM.description = "대전쟁 전에 만들어진 맛있는 사과맛 간식입니다.\n방사능에 오염되어 있습니다."
ITEM.price = 5
ITEM.hunger = 15
ITEM.radiation = 10
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)