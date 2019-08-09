ITEM.name = "누카 체리"
ITEM.model = "models/mosi/fallout4/props/drink/nukacola.mdl"
ITEM.skin = 2
ITEM.description = "붉은 색의 체리맛 누카 콜라입니다.\n원래는 멀 해버스튼이란 사람이 만든 멀의 베리 체리 소다였지만, 누카 콜라 사가 특허권을 인수하고 누카 콜라만의 특유한 맛과 배합했습니다."
ITEM.price = 40
ITEM.thirst = 15
ITEM.radiation = 3
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(15)
	client:GetCharacter():GiveMoney(1)
end)