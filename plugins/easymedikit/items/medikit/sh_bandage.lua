ITEM.name = "붕대"
ITEM.description = "상처 부위를 압박하여 출혈을 줄여 줍니다."
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.price = 20
ITEM.healthPoint = 15 -- Health point that the player will get
ITEM.medAttr = 0 -- How much medical attribute the character needs

ITEM:Hook("Apply", function(item)
	local client = item.player
	client:EmitSound("physics/body/body_medium_scrape_rough_loop1.wav")
end)

ITEM:Hook("Give", function(item)
	local client = item.player
	client:EmitSound("physics/body/body_medium_scrape_rough_loop1.wav")
end)