FACTION.name = "황무지인"
FACTION.description = "모하비 황무지와 그곳의 폐허에서 사는 평범한 사람들입니다."
FACTION.color = Color(0, 140, 0)
FACTION.isDefault = true
FACTION.pay = 6

FACTION.models = {
	"models/player/neutral/hub/wastelander1_female_01.mdl",
	"models/player/neutral/hub/wastelander1_female_04.mdl",
	"models/player/neutral/hub/wastelander1_female_07.mdl",
	"models/player/neutral/hub/wastelander1_female_ghoul.mdl",
	"models/player/neutral/hub/wastelander1_male_01.mdl",
	"models/player/neutral/hub/wastelander1_male_05.mdl",
	"models/player/neutral/hub/wastelander1_male_09.mdl",
	"models/player/neutral/hub/wastelander1_male_ghoul.mdl",
	"models/player/neutral/hub/wastelander2_female_01.mdl",
	"models/player/neutral/hub/wastelander2_female_04.mdl",
	"models/player/neutral/hub/wastelander2_female_07.mdl",
	"models/player/neutral/hub/wastelander2_female_ghoul.mdl",
	"models/player/neutral/hub/wastelander2_male_01.mdl",
	"models/player/neutral/hub/wastelander2_male_05.mdl",
	"models/player/neutral/hub/wastelander2_male_09.mdl",
	"models/player/neutral/hub/wastelander2_male_ghoul.mdl",
	"models/player/neutral/hub/wastelander3_female_01.mdl",
	"models/player/neutral/hub/wastelander3_female_04.mdl",
	"models/player/neutral/hub/wastelander3_female_07.mdl",
	"models/player/neutral/hub/wastelander3_female_ghoul.mdl",
	"models/player/neutral/hub/wastelander3_male_01.mdl",
	"models/player/neutral/hub/wastelander3_male_05.mdl",
	"models/player/neutral/hub/wastelander3_male_09.mdl",
	"models/player/neutral/hub/wastelander3_male_ghoul.mdl"
}

function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()
	
	inventory:Add("sunsetsarsaparilla", 2)
	inventory:Add("brahminsteak", 1)
	inventory:Add("bandage", 1)
	inventory:Add("money", 3)
end

FACTION_WASTELANDER = FACTION.index