ITEM.name = "의사의 왕진 가방"
ITEM.description = "체력을 75만큼 회복합니다.\n의학 지식이 10 이상이여야만 사용할 수 있습니다."
ITEM.model = "models/fallout/clutter/health/doctorbag.mdl"
ITEM.category = "Medical"
ITEM.price = 55
ITEM.healthPoint = 75 -- Health point that the player will get
ITEM.medAttr = 10 -- How much medical attribute the character needs

ITEM:Hook("Apply", function(item)
	local client = item.player
	client:EmitSound("ui/open_loot.wav")
end)

ITEM:Hook("Give", function(item)
	local client = item.player
	client:EmitSound("ui/open_loot.wav")
end)