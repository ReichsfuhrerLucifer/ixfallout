ITEM.name = "당근"
ITEM.model = "models/mosi/fallout4/props/food/carrot.mdl"
ITEM.description = "대전쟁 이전의 당근과는 유전자 변형으로 사뭇 달라졌습니다."
ITEM.price = 3
ITEM.hunger = 10
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)