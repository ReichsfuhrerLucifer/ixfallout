ITEM.name = "풍선껌"
ITEM.model = "models/mosi/fallout4/props/food/bubblegum.mdl"
ITEM.description = "씹으면 단 맛이 나는 풍선껌입니다."
ITEM.price = 1
ITEM.radiation = 1
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 1, client:GetMaxHealth()))
end)