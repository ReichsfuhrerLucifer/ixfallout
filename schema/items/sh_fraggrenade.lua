ITEM.name = "세열 수류탄"
ITEM.description = "폭발할 때에 금속 파편이 퍼져서 살상 범위를 확대하는 수류탄입니다."
ITEM.class = "weapon_grenadefrag"
ITEM.category = "수류탄"
ITEM.model = "models/halokiller38/fallout/weapons/explosives/fraggrenade.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 150
ITEM.exRender = true
ITEM.functions.Use = {
	name = "던질 준비하기",
	tip = "equipTip",
	icon = "icon16/add.png",
	sound = "items/ammo_pickup.wav",
	OnRun = function(item)
		item.player:Give(item.class)
	end
}