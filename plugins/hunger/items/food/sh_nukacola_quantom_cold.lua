ITEM.name = "누카 콜라 퀀텀"
ITEM.model = "models/mosi/fallout4/props/drink/nukacola2.mdl"
ITEM.description = "누카 콜라에 상큼한 형광 파란색과 톡 쏘는 맛을 증가시킨 시제품으로, 2077년 10월 23일 핵전쟁 당일 출시되어 매우 희귀합니다.\n냉장고에서 보관되어 얼음처럼 차갑습니다."
ITEM.price = 30
ITEM.thirst = 10
ITEM.radiation = 5
ITEM.category = "consumables"
ITEM.empty = "nukacola_bottle"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(30)
	client:GetCharacter():GiveMoney(1)
end)