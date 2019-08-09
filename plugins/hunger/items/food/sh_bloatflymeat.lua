ITEM.name = "거대 파리 고기"
ITEM.model = "models/mosi/fallout4/props/food/bloatflymeat.mdl"
ITEM.description = "황무지에 많이 서식하는 거대 파리의 고기입니다."
ITEM.price = 4
ITEM.hunger = 25
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)