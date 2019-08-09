ITEM.name = "슈가밤"
ITEM.model = "models/mosi/fallout4/props/food/sugarbombs.mdl"
ITEM.description = "우유와 설탕으로 만든 끔찍하게 달달한 과자입니다."
ITEM.price = 5
ITEM.hunger = 30
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)