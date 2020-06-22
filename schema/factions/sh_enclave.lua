FACTION.name = "Enclave"
FACTION.description = "factionEnclaveDesc"
FACTION.color = Color(93, 93, 93)
FACTION.isDefault = false
FACTION.pay = 10

FACTION.models = {
	"models/enclave/enclaveofficer_01.mdl",
	"models/enclave/enclaveofficer_01_1.mdl",
	"models/enclave/enclaveofficer_02.mdl",
	"models/enclave/enclaveofficer_02_1.mdl"
}

function FACTION:OnCharacterCreated(client, character)
	inventory:Add("laserrifle", 1)
	inventory:Add("microfusioncell", 3)
	inventory:Add("enclave_combat_armor", 1)
	inventory:Add("water", 1)
	inventory:Add("cram", 1)
end

FACTION_ENCLAVE = FACTION.index