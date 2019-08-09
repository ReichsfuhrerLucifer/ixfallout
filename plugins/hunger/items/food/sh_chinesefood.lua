ITEM.name = "중국식 국수"
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.description = "종이 포장 상자에 매콤한 중국식 볶음 국수가 담겨있습니다."
ITEM.price = 5
ITEM.hunger = 25
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)