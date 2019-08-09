ITEM.name = "데스클로 오믈렛"
ITEM.model = "models/mosi/fallout4/props/food/deathclawomelette.mdl"
ITEM.description = "황무지에서 가장 흉포한 생물 중 하나인 데스클로의 알로 만든 오믈렛입니다."
ITEM.price = 100
ITEM.hunger = 100
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 20, client:GetMaxHealth()))
end)