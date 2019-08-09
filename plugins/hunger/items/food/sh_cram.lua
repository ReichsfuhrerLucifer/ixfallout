ITEM.name = "크램"
ITEM.model = "models/mosi/fallout4/props/food/cram.mdl"
ITEM.description = "통조림 캔에 돼지고기를 갈아서 다진 햄이 들어있습니다."
ITEM.price = 5
ITEM.hunger = 50
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)