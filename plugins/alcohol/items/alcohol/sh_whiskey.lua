ITEM.name = "위스키"
ITEM.description = "스코틀랜드에서 유래한 술로 가장 유명한 증류주입니다."
ITEM.model = "models/mosi/fallout4/props/alcohol/whiskey.mdl"
ITEM.force = 10
ITEM.thirst = 25
ITEM.price = 10

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:GetCharacter():GiveMoney(1)
end)