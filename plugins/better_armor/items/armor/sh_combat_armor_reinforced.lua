
ITEM.name = "강화 컴뱃 아머"
ITEM.description = "2051년에 처음 제작된 군용 보병 전투복으로, 복합 고분자 세라믹으로 만든 단단한 외장 플레이트와 방탄 소재가 결합된 유연한 안감으로 신체의 주요 부분을 총격으로부터 보호하도록 설계되었습니다.\n기존 컴뱃 아머를 개량하여 보호성이 강화되고 방탄모에 전술 바이저가 부착되었습니다.\n여성 캐릭터는 이 의상을 착용할 수 없습니다.\n백인/흑인/황인 피부 변경은 관리자에게 문의 바랍니다."
ITEM.model = "models/props_c17/SuitCase_Passenger_Physics.mdl"
ITEM.height = 2
ITEM.width = 2
ITEM.armorAmount = 210
ITEM.price = 9000
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
	{"male_", "mark1/"},
	{"01", "mark1"},
	{"05", "mark1"},
	{"09", "mark1"},
	{"ghoul", "mark1_ghoul"}
}

ITEM.maxDurability = 700