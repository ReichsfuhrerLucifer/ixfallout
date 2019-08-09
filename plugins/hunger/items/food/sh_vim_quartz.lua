ITEM.name = "빔 쿼츠"
ITEM.model = "models/mosi/fallout4/props/drink/vim.mdl"
ITEM.description = "누카 콜라보다는 유명하지 않지만, 메인 주에서만큼은 최고로 인기 있었던 탄산 음료인 빔의 강화판으로, '쿼츠'라는 이름 때문에 누카 콜라와 법적 공방을 이어오다 패소하여, 2077년 10월 23일 핵전쟁이 벌어진 당일에 철수가 확정되었습니다."
ITEM.skin = 1
ITEM.price = 25
ITEM.thirst = 30
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(20)
	client:GetCharacter():GiveMoney(1)
end)