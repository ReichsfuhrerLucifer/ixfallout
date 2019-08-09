ITEM.name = "선셋 사르사파릴라"
ITEM.model = "models/mosi/fallout4/props/drink/sunsetsarsaparilla.mdl"
ITEM.description = "새서프래스 뿌리에서 짜낸 향유로 만든 탄산음료입니다."
ITEM.price = 3
ITEM.thirst = 25
ITEM.category = "consumables"
ITEM.empty = "sunsetsarsaparilla_bottle"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(10)
	client:GetCharacter():GiveMoney(1)
end)