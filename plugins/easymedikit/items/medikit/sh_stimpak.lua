ITEM.name = "스팀팩"
ITEM.description = "부상을 치료하는 휴대용 의료 주사입니다."
ITEM.model = "models/mosi/fallout4/props/aid/stimpak.mdl"
ITEM.category = "Medical"
ITEM.price = 75
ITEM.healthPoint = 30 -- Health point that the player will get
ITEM.medAttr = 0 -- How much medical attribute the character needs

ITEM:Hook("Apply", function(item)
	local client = item.player
	client:EmitSound("ui/stim.wav")
end)

ITEM:Hook("Give", function(item)
	local client = item.player
	client:EmitSound("ui/stim.wav")
end)