ITEM.name = "포도주"
ITEM.description = "포도를 으깨서 나온 즙을 발효시킨 과실주로, 상류층이 주로 즐깁니다."
ITEM.model = "models/mosi/fallout4/props/alcohol/wine.mdl"
ITEM.force = 5
ITEM.thirst = 15
ITEM.price = 10

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:GetCharacter():GiveMoney(1)
end)