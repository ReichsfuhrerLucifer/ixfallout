ITEM.name = "누카 콜라 쿼츠"
ITEM.model = "models/mosi/fallout4/props/drink/nukacola.mdl"
ITEM.skin = 5
ITEM.description = "누카 콜라에 상큼한 형광 노란색과 톡 쏘는 맛을 증가시킨 제품으로, '쿼츠'라는 이름을 달고 출시된 빔 쿼츠 때문에 빔과 법적 공방을 이어오다 승소하여 계속 판매될 수 있었습니다."
ITEM.price = 48
ITEM.thirst = 30
ITEM.radiation = 15
ITEM.category = "consumables"
ITEM.empty = "nukacola_bottle"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(20)
	client:GetCharacter():GiveMoney(1)
end)