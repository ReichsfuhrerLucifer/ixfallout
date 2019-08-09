ITEM.name = "오염된 감자칩"
ITEM.model = "models/mosi/fallout4/props/food/potatocrisps.mdl"
ITEM.description = "감자 밀가루 반죽을 얇게 튀긴 바삭하고 짭짤한 과자입니다.\n방사능에 오염되어 있습니다."
ITEM.price = 5
ITEM.hunger = 10
ITEM.thirst = -10
ITEM.radiation = 10
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)