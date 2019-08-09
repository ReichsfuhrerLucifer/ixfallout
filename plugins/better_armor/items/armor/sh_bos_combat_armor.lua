
ITEM.name = "컴뱃 아머\n(BOS)"
ITEM.description = "2051년에 처음 제작된 군용 보병 전투복으로, 복합 고분자 세라믹으로 만든 단단한 외장 플레이트와 방탄 소재가 결합된 유연한 안감으로 신체의 주요 부분을 총격으로부터 보호하도록 설계되었습니다.\n브라더후드 오브 스틸 도색이 되어 있습니다."
ITEM.model = "models/props_c17/SuitCase_Passenger_Physics.mdl"
ITEM.height = 2
ITEM.width = 2
ITEM.armorAmount = 210
ITEM.price = 9300
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
	{"neutral/hub/wastelander1", "bs/hub/recon"},
	{"neutral/hub/wastelander2", "bs/hub/recon"},
	{"neutral/hub/wastelander3", "bs/hub/recon"}
}

ITEM.maxDurability = 625