ITEM.name = "오염된 포크 & 빈즈"
ITEM.model = "models/mosi/fallout4/props/food/porknbeans.mdl"
ITEM.description = "돼지고기와 강낭콩을 끓인 기름진 스튜가 통조림에 들어있습니다.\n방사능에 오염되어 있습니다."
ITEM.price = 2
ITEM.hunger = 40
ITEM.thirst = -20
ITEM.radiation = 10
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)