ITEM.name = "인육"
ITEM.model = "models/mosi/fallout4/props/food/humanmeat.mdl"
ITEM.description = "사람의 살점을 조리했습니다... 우웩.."
ITEM.price = 0
ITEM.hunger = 60
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 25, client:GetMaxHealth()))
end)