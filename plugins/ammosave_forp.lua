PLUGIN.name = "Ammo Saver (Fallout RP)"
PLUGIN.author = "Black Tea and Frosty"
PLUGIN.description = "Saves the ammo of a character."
PLUGIN.ammoList = {}

ix.ammo = ix.ammo or {}

function ix.ammo.Register(name)
	table.insert(PLUGIN.ammoList, name)
end

-- Register Ammunition.
ix.ammo.Register("12Gauge")
ix.ammo.Register("20Gauge")
ix.ammo.Register("5mm")
ix.ammo.Register("556mm")
ix.ammo.Register("9mm")
ix.ammo.Register("10mm")
ix.ammo.Register("40mmGrenade")
ix.ammo.Register("308")
ix.ammo.Register("357Magnum")
ix.ammo.Register("44Magnum")
ix.ammo.Register("50MG")
ix.ammo.Register("ElectronChargePack")
ix.ammo.Register("EnergyCell")
ix.ammo.Register("Flamer")
ix.ammo.Register("MicrofusionCell")
ix.ammo.Register("MiniNuke")
ix.ammo.Register("Missile")
ix.ammo.Register("FragGrenade")
ix.ammo.Register("22LR")

-- Called right before the character has its information save.
function PLUGIN:CharacterPreSave(character)
	-- Get the player from the character.
	local client = character:GetPlayer()

	-- Check to see if we can get the player's ammo.
	if (IsValid(client)) then
		local ammoTable = {}

		for _, v in ipairs(self.ammoList) do
			local ammo = client:GetAmmoCount(v)

			if (ammo > 0) then
				ammoTable[v] = ammo
			end
		end

		character:SetData("ammo", ammoTable)
	end
end

-- Called after the player's loadout has been set.
function PLUGIN:PlayerLoadedCharacter(client)
	timer.Simple(0.25, function()
		if (!IsValid(client)) then
			return
		end

		-- Get the saved ammo table from the character data.
		local character = client:GetCharacter()

		if (!character) then
			return
		end

		local ammoTable = character:GetData("ammo")

		-- Check if the ammotable is exists.
		if (ammoTable) then
			for k, v in pairs(ammoTable) do
				client:SetAmmo(v, tostring(k))
			end
		end
	end)
end
