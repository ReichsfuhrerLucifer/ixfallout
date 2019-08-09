ITEM.name = "문샤인"
ITEM.description = "가정에서 양조해서 가끔씩 마시는 술로, 보통 옥수수를 주 원료로 사용한 콘 위스키의 형태를 가지고 있으며 거기에 맥아와 이스트 등을 사용해 발효한 밑술을 위의 제조 공정에 따라 증류하여 만듭니다."
ITEM.model = "models/mosi/fallout4/props/alcohol/moonshine.mdl"
ITEM.force = 10
ITEM.thirst = 25
ITEM.price = 20

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:GetCharacter():GiveMoney(1)
end)