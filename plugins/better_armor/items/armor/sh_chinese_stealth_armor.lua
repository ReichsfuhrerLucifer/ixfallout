
ITEM.name = "중공군 스텔스 아머"
ITEM.description = "흑귀 스텔스 아머는 미중 전쟁 당시 알래스카 전선에서 중공군이 미군의 파워 아머에 대항하기 위해서 개발되었습니다."
ITEM.model = "models/props_c17/SuitCase_Passenger_Physics.mdl"
ITEM.height = 2
ITEM.width = 2
ITEM.armorAmount = 120
ITEM.price = 500
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
	{"player/neutral/hub/wastelander1", "ninja/chinese"},
	{"player/neutral/hub/wastelander2", "ninja/chinese"},
	{"player/neutral/hub/wastelander3", "ninja/chinese"},
	{"_male_", "_m_npc"},
	{"_female_", "_f_npc"},
	{"01", ""},
	{"04", ""},
	{"05", ""},
	{"07", ""},
	{"09", ""},
	{"ghoul", ""}
}

ITEM:Hook("Equip", function(item)
	local client = item.player
	local char = client:GetCharacter()
	local inv = char:GetInventory()
	local items = inv:GetItems()
	local stealthColor = Color( 255, 255, 255, 25 )
	
	client:SetColor(stealthColor)
	client:SetRenderMode( RENDERMODE_TRANSALPHA )
	client:DrawShadow(false)
	client:SetNoTarget(true)
	client:EmitSound("items/suitchargeok1.wav")
end)

ITEM:Hook("EquipUn", function(item)
	local client = item.player
	local char = client:GetCharacter()
	local inv = char:GetInventory()
	local items = inv:GetItems()
	local oldColor = Color( 255, 255, 255, 255 )
	
	client:SetColor(oldColor)
	client:SetRenderMode( RENDERMODE_TRANSALPHA )
	client:DrawShadow(true)
	client:SetNoTarget(false)
	client:EmitSound("items/suitchargeno1.wav")
end)