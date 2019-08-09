ITEM.name = "정제된 물"
ITEM.model = "models/mosi/fallout4/props/drink/water.mdl"
ITEM.description = "재난 상황에 대비해 정부에서 비축해 둔 정제된 물입니다."
ITEM.price = 20
ITEM.thirst = 50
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 20, client:GetMaxHealth()))
end)