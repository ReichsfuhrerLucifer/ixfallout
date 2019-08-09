ITEM.name = "누카 콜라"
ITEM.model = "models/mosi/fallout4/props/drink/nukacola.mdl"
ITEM.description = "대전쟁 전 미국에서 가장 인기있었던 탄산 음료로, 2044년 처음 나왔을 때는 그냥 방사능이 없는 평범한 탄산음료였으나 출시와 같은 해에 일어난 과일 대기근으로 인해 생산에 필요한 재료들을 구하기가 어려워지자 성분이 아예 바뀌어 출시되었습니다."
ITEM.price = 20
ITEM.thirst = 10
ITEM.radiation = 3
ITEM.category = "consumables"
ITEM.empty = "nukacola_bottle"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(10)
	client:GetCharacter():GiveMoney(1)
end)