ITEM.name = "누카 그레이프"
ITEM.model = "models/mosi/fallout4/props/drink/nukacola.mdl"
ITEM.skin = 3
ITEM.description = "보라색의 포도맛 누카 콜라입니다.\n원래는 조니 쳉이라는 사람이 만든 그레이프 펄 소다였지만, 누카 콜라 사가 특허권을 인수하고 누카 콜라만의 특유한 맛과 배합했습니다."
ITEM.price = 20
ITEM.thirst = 15
ITEM.radiation = -4
ITEM.category = "consumables"
ITEM.empty = "nukacola_bottle"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(15)
	client:GetCharacter():GiveMoney(1)
end)