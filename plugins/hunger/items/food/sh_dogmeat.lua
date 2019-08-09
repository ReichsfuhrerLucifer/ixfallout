ITEM.name = "개 고기"
ITEM.model = "models/mosi/fallout4/props/food/dogmeat.mdl"
ITEM.description = "황무지에서 흔하게 볼 수 있는 야생 들개의 고기입니다."
ITEM.price = 4
ITEM.hunger = 35
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)