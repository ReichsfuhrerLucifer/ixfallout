ITEM.name = "슈퍼 스팀팩"
ITEM.description = "부상을 치료하는 휴대용 의료 주사인 스팀팩의 강화판으로, 좋지 않은 부작용이 있다는 이야기가 있습니다."
ITEM.model = "models/fallout_4/props/superstimpak.mdl"
ITEM.category = "Medical"
ITEM.price = 150
ITEM.healthPoint = 60 -- Health point that the player will get
ITEM.medAttr = 0 -- How much medical attribute the character needs

ITEM:Hook("Apply", function(item)
	local client = item.player
	client:EmitSound("ui/stim.wav")
end)

ITEM:Hook("Give", function(item)
	local client = item.player
	client:EmitSound("ui/stim.wav")
end)