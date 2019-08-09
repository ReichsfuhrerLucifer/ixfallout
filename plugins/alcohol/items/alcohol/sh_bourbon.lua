ITEM.name = "버본"
ITEM.description = "미국 켄터키를 중심으로 생산되는 위스키입니다."
ITEM.model = "models/mosi/fallout4/props/alcohol/bourbon.mdl"
ITEM.force = 10
ITEM.thirst = 25
ITEM.price = 7

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:GetCharacter():GiveMoney(1)
end)