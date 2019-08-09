ITEM.name = "데스클로 고기"
ITEM.model = "models/mosi/fallout4/props/food/deathclawmeat.mdl"
ITEM.description = "황무지에서 가장 흉포한 생물 중 하나인 데스클로의 살점입니다."
ITEM.price = 110
ITEM.hunger = 90
ITEM.radiation = 6
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)