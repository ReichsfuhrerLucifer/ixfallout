ITEM.name = "검드롭"
ITEM.model = "models/mosi/fallout4/props/food/gumdrops.mdl"
ITEM.description = "젤리의 일종으로 포장지에 '방사능 검드롭'이라고 쓰여 있습니다."
ITEM.price = 2
ITEM.radiation = 1
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 1, client:GetMaxHealth()))
end)