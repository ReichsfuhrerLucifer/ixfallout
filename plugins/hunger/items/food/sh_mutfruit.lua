ITEM.name = "뮤트푸르트"
ITEM.model = "models/mosi/fallout4/props/food/mutfruit.mdl"
ITEM.description = "일종의 과일인 것 같은데 대전쟁 이전에는 없었던 종입니다."
ITEM.price = 5
ITEM.hunger = 20
ITEM.thirst = 10
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)