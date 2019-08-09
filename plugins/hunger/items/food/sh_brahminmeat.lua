ITEM.name = "브라민 고기"
ITEM.model = "models/mosi/fallout4/props/food/meat.mdl"
ITEM.description = "황무지에서 가축으로 흔하게 기르는 브라민의 고기입니다."
ITEM.price = 5
ITEM.hunger = 50
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)