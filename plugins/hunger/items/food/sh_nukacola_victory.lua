ITEM.name = "누카 콜라 빅토리"
ITEM.model = "models/mosi/fallout4/props/drink/nukacola2.mdl"
ITEM.skin = 2
ITEM.description = "미국 국기에서 따와 백, 적, 청으로 라벨을 칠한 누카 콜라의 빅토리 에디션입니다.\n누카 콜라 광고에 따르면 이 애국적인 상쾌함은 서부를 벗어난 지역에서 큰 인기를 끌고 있다고 합니다."
ITEM.price = 40
ITEM.thirst = 25
ITEM.radiation = 15
ITEM.category = "consumables"
ITEM.empty = "nukacola_bottle"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 10, client:GetMaxHealth()))
	client:RestoreStamina(20)
	client:GetCharacter():GiveMoney(1)
end)