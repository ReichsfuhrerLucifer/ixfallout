ITEM.name = "누카 콜라 다크"
ITEM.model = "models/mosi/fallout4/props/drink/nukacola.mdl"
ITEM.skin = 6
ITEM.description = "비쩍 타들어가는 듯한 갈증을 풀어주는 어른들의 누카 콜라입니다."
ITEM.price = 50
ITEM.force = 35
ITEM.thirst = 10
ITEM.category = "consumables"

ITEM:Hook("eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:GetCharacter():GiveMoney(1)
end)