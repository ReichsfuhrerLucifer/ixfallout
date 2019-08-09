ITEM.name = "T-60 파워 아머"
ITEM.description = "앵커리지 전투 이후부터 배치되기 시작한 파워 아머로, T-45 파워 아머의 설계를 기반으로 하고 있어 쉽게 개수가 가능합니다."
ITEM.model = "models/mosi/fallout4/props/fortifications/vaultcrate04.mdl"
ITEM.width = 3
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(409.7919921875, 344.36294555664, 269),
	ang = Angle(25, 220, 0),
	fov = 8.5
}
ITEM.exRender = true
ITEM.armorAmount = 225
ITEM.price = 10000
ITEM.gasmask = false -- It will protect you from bad air
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
			0.2, -- Bullets
			0.2, -- Slash
			0.2, -- Shock
			0.2, -- Burn
			0.2, -- Radiation
			1, -- Acid
			0.2, -- Explosion
}
ITEM.replacements = "models/adi/t601_rustvar2_pm.mdl"

ITEM.maxDurability = 2400
