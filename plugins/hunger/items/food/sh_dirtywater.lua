ITEM.name = "더러운 물"
ITEM.model = "models/mosi/fallout4/props/drink/dirtywater.mdl"
ITEM.description = "방사능과 흙먼지로 오염된 더러운 물이지만, 그나마 마실 수 있습니다."
ITEM.price = 10
ITEM.thirst = 50
ITEM.radiation = 6
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 10, client:GetMaxHealth()))
end)