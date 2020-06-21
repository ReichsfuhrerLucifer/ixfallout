ITEM.name = "Outcast T-45d power armor"
ITEM.description = "itemT45DPowerArmorOutcastDesc"
ITEM.model = "models/mosi/fallout4/props/fortifications/vaultcrate04.mdl"
ITEM.width = 3
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(409.7919921875, 344.36294555664, 269),
	ang = Angle(25, 220, 0),
	fov = 8.5
}
ITEM.exRender = true
-- ITEM.armorAmount = 225
-- ITEM.price = 5800
ITEM.price = 1110
ITEM.gasmask = false -- It will protect you from bad air
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
			0.52, -- Bullets
			0.52, -- Slash
			0.52, -- Shock
			0.52, -- Burn
			0.87, -- Radiation
			1, -- Acid
			0.52, -- Explosion
}
ITEM.replacements = "models/fallout_3/power_armor_outcast.mdl"

ITEM.maxDurability = 1075

ITEM:Hook("Equip", function(item)
	local client = item.player
	local char = client:GetCharacter()
	local str = char:GetAttribute("str", 0)
	local stm = char:GetAttribute("stm", 0)
	
	char:SetAttrib("str", math.max(str + 2, 0))
	char:SetAttribute("stm", math.max(stm - 2, 0))
end)

ITEM:Hook("EquipUn", function(item)
	local client = item.player
	local char = client:GetCharacter()
	local str = char:GetAttribute("str", 0)
	local stm = char:GetAttribute("stm", 0)
	
	char:SetAttrib("str", math.max(str - 2, 0))
	char:SetAttribute("stm", math.max(stm + 2, 0))
end)