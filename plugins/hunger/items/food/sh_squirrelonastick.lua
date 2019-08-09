ITEM.name = "다람쥐 꼬치구이"
ITEM.model = "models/mosi/fallout4/props/food/squirrelonastick.mdl"
ITEM.description = "다람쥐 고기를 꼬치에 꽂아 조리한 음식입니다."
ITEM.price = 5
ITEM.hunger = 75
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)