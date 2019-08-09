
ITEM.name = "용병 탐험가 복장"
ITEM.description = "모하비 황무지를 돌아다니는 용병 탐험가의 복장입니다.\n여성 캐릭터는 이 의상을 착용할 수 없습니다.\n백인/흑인/황인 피부 변경은 관리자에게 문의 바랍니다."
ITEM.model = "models/props_c17/SuitCase_Passenger_Physics.mdl"
ITEM.height = 2
ITEM.width = 2
ITEM.armorAmount = 10
ITEM.price = 50
ITEM.gasmask = false -- It will protect you from bad air
ITEM.resistance = false -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
			1, -- Bullets
			1, -- Slash
			1, -- Shock
			1, -- Burn
			1, -- Radiation
			1, -- Acid
			1, -- Explosion
}

ITEM.replacements = {
	{"neutral/hub", "hub/neutrals"},
	{"wastelander1_", ""},
	{"wastelander2_", ""},
	{"wastelander3_", ""},
	{"male_", "mercenary/"},
	{"01", "mercenary"},
	{"05", "mercenary"},
	{"09", "mercenary"},
	{"ghoul", "mercenary_ghoul"}
}

ITEM.maxDurability = 100