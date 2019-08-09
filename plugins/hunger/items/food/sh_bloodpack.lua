ITEM.name = "혈액 팩"
ITEM.model = "models/mosi/fallout4/props/aid/bloodbag.mdl"
ITEM.description = "수혈에 쓰기 위해 혈액을 담은 팩입니다."
ITEM.price = 5
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 1, client:GetMaxHealth()))
end)