ITEM.name = "T-51b 파워 아머"
ITEM.description = "대전쟁 중 미군이 전차 대용으로 개발한 강화복인 T-51b 파워 아머입니다."
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
ITEM.price = 7200
ITEM.gasmask = false -- It will protect you from bad air
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
			0.4, -- Bullets
			0.4, -- Slash
			0.4, -- Shock
			0.4, -- Burn
			0.75, -- Radiation
			1, -- Acid
			0.4, -- Explosion
}
ITEM.replacements = "models/fallout_3/t51b.mdl"

ITEM.maxDurability = 2100
