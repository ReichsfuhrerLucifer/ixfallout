ITEM.name = "럼"
ITEM.description = "사탕수수를 착즙해서 설탕을 만들고 남은 찌꺼기인 당밀이나 사탕수수 즙을 발효시킨 뒤 증류한 술로, 옛날 뱃사람들이 주로 마셨다고 합니다."
ITEM.model = "models/mosi/fallout4/props/alcohol/rum.mdl"
ITEM.force = 10
ITEM.thirst = 25
ITEM.price = 8

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:GetCharacter():GiveMoney(1)
end)