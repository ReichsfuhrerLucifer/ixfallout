
ITEM.name = "Leather armor, reinforced"
ITEM.description = "itemLeatherArmorReinforcedDesc2"
ITEM.model = "models/props_c17/SuitCase_Passenger_Physics.mdl"
ITEM.height = 2
ITEM.width = 2
ITEM.armorAmount = 100
ITEM.price = 1200
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
	{"male_", "leather/"},
	{"01", "leather"},
	{"05", "leather"},
	{"09", "leather"},
	{"ghoul", "leather_ghoul"}
}

ITEM.maxDurability = 250