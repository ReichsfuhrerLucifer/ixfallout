ITEM.name = "보드카"
ITEM.description = "수수, 옥수수, 감자, 밀, 호밀 등 탄수화물 함량이 높은 식물로 빚은 러시아 원산의 증류주입니다."
ITEM.model = "models/mosi/fallout4/props/alcohol/vodka.mdl"
ITEM.force = 10
ITEM.thirst = 25
ITEM.price = 20

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:GetCharacter():GiveMoney(1)
end)