
ITEM.name = "리콘 아머"
ITEM.description = "파워 아머를 입을 때 안에 받혀 입어야 한다는 복장이지만, 이 상태로도 전투에 참여할 수 있습니다.\n구울 캐릭터는 입을 수 없습니다."
ITEM.model = "models/Items/item_item_crate.mdl"
ITEM.height = 2
ITEM.width = 2
ITEM.armorAmount = 170
ITEM.price = 7240
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
	{"neutral/hub/wastelander1", "bs/hub/spec"},
	{"neutral/hub/wastelander2", "bs/hub/spec"},
	{"neutral/hub/wastelander3", "bs/hub/spec"}
}

ITEM.maxDurability = 440