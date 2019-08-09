ITEM.name = "오염된 얌얌 악마알"
ITEM.model = "models/mosi/fallout4/props/food/yumyumdeviledeggs.mdl"
ITEM.description = "전쟁 전 얌얌 사에서 만든 달걀 즉석 요리입니다.\n방사능에 오염되어 있습니다."
ITEM.price = 3
ITEM.hunger = 10
ITEM.radiation = 10
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)