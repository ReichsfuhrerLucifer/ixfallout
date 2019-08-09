ITEM.name = "개 사료"
ITEM.model = "models/mosi/fallout4/props/food/dogfood.mdl"
ITEM.description = "집에서 기르는 개에게 주는 사료지만, 여의치 않다면 먹을 순 있습니다."
ITEM.price = 5
ITEM.hunger = 10
ITEM.radiation = 2
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)