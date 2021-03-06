
ITEM.name = "Combat armor, reinforced"
ITEM.description = "itemCombatArmorReinforcedDesc2"
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
	{"player/neutral/hub", "hub/extra"},
	{"wastelander1_", "combatarmour_mk1_"},
	{"wastelander2_", "combatarmour_mk1_"},
	{"wastelander3_", "combatarmour_mk1_"},
	{"04", "01"},
	{"07", "01"},
	{"female_ghoul", "female_01"},
	{"01", "09"},
	{"05", "09"},
	{"male_ghoul", "male_09"},
}

ITEM.maxDurability = 700