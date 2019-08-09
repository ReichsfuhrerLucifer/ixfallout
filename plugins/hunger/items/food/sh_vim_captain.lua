ITEM.name = "빔 선장의 비법"
ITEM.model = "models/mosi/fallout4/props/drink/vim.mdl"
ITEM.description = "누카 콜라보다는 유명하지 않지만, 메인 주에서만큼은 최고로 인기 있었던 탄산 음료, 빔의 바다맛 버전입니다.\n또 다른 이름으로 테스트 화학식 10784라 불리며, 이 맛은 누카 콜라의 사보타주로 회사의 재무상태가 악화되자 이를 타개하기 위해 개발한 맛이었습니다. 당시 마케팅 팀은 '메인 주의 맛'을 담아내라며 R&D 부서에 새로운 음료 개발을 지시했는데, 모호한 지시에 화가 난 연구원은 그냥 될대로 되라는 듯 말 그대로 해당 지역의 특산물인 청나래고사리와 랍스터 껍질을 넣은 청량음료를 만들어냈습니다. 그런데 예상 외로 시제품이 테스터들에게 인기를 얻는 바람에 이 시제품에 'Captain's Blend'라는 이름을 붙이며, 냄새를 잡기 위해 애스터를 첨가하는 등 본격적인 제품 개발에 착수했습니다. 하지만 레시피를 다 만들어놓고도, 그 유별난 특징 때문에 제품 출시를 주저하는 사이에 전쟁이 발발하고 말았습니다."
ITEM.skin = 2
ITEM.price = 50
ITEM.thirst = 30
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(20)
	client:GetCharacter():GiveMoney(1)
end)