
ITEM.name = "방사능 방호복"
ITEM.description = "방사능에 오염된 주변 환경으로부터 착용자를 보호합니다."
ITEM.model = "models/props_c17/SuitCase_Passenger_Physics.mdl"
ITEM.width = 2
ITEM.armorAmount = 40
ITEM.height = 2
ITEM.price = 60
ITEM.gasmask = false
ITEM.resistance = true
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
			1, -- Bullets
			1, -- Slash
			1, -- Shock
			1, -- Burn
			0, -- Radiation
			1, -- Acid
			1, -- Explosion
}
ITEM.replacements = {
	{"player/neutral/hub/wastelander1", "kuma96/hazmatsuit"},
	{"player/neutral/hub/wastelander2", "kuma96/hazmatsuit"},
	{"player/neutral/hub/wastelander3", "kuma96/hazmatsuit"},
	{"_female_01", "_female/hazmatsuit_female_pm"},
	{"_female_04", "_female/hazmatsuit_female_pm"},
	{"_female_07", "_female/hazmatsuit_female_pm"},
	{"_female_ghoul", "_female/hazmatsuit_female_pm"},
	{"_male_01", "_male/hazmatsuit_male_pm"},
	{"_male_05", "_male/hazmatsuit_male_pm"},
	{"_male_09", "_male/hazmatsuit_male_pm"},
	{"_male_ghoul", "_male/hazmatsuit_male_pm"}
}

ITEM.maxDurability = 150