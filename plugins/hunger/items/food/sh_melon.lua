ITEM.name = "메론"
ITEM.model = "models/mosi/fallout4/props/food/melon.mdl"
ITEM.description = "대전쟁 이전의 메론과는 유전자 변형으로 사뭇 달라졌습니다."
ITEM.price = 6
ITEM.hunger = 10
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)