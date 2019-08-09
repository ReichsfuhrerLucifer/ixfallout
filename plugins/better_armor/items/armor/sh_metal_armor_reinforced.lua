
ITEM.name = "강화 메탈 아머"
ITEM.description = "무겁고 단단한 금속을 전신에 두른 갑옷입니다."
ITEM.model = "models/props_c17/SuitCase_Passenger_Physics.mdl"
ITEM.height = 2
ITEM.width = 2
ITEM.armorAmount = 150
ITEM.price = 3500
ITEM.gasmask = false -- It will protect you from bad air
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
			0.7, -- Bullets
			0.7, -- Slash
			0.7, -- Shock
			0.7, -- Burn
			1, -- Radiation
			1, -- Acid
			0.7, -- Explosion
}
ITEM.replacements = {
	{"wastelander1", "metalarmour_mk2"},
	{"wastelander2", "metalarmour_mk2"},
	{"wastelander3", "metalarmour_mk2"}
}

ITEM.maxDurability = 250