ITEM.name = "누카 콜라 와일드"
ITEM.model = "models/mosi/fallout4/props/drink/nukacola2.mdl"
ITEM.skin = 1
ITEM.description = "서부에서 가장 인기있는 음료인 선셋 사르사파릴라의 대항마로 제작된 누카 콜라입니다.\n누카 콜라 광고에 따르면 서부의 사람들은 애국심으로 누카콜라 와일드와 빅토리를 즐긴다고 합니다."
ITEM.price = 20
ITEM.thirst = 20
ITEM.radiation = 4
ITEM.category = "consumables"
ITEM.empty = "nukacola_bottle"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(10)
	client:GetCharacter():GiveMoney(1)
end)