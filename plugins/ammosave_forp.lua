PLUGIN.name = "Ammo Saver (Fallout RP)"
PLUGIN.author = "Black Tea and Frosty"
PLUGIN.desc = "Saves the ammo of a character."
PLUGIN.ammoList = {}

ix.ammo = ix.ammo or {}

function ix.ammo.register(name)
	table.insert(PLUGIN.ammoList, name)
end

-- Register Ammunition.
ix.ammo.register("12Gauge")
ix.ammo.register("20Gauge")
ix.ammo.register("5mm")
ix.ammo.register("556mm")
ix.ammo.register("9mm")
ix.ammo.register("10mm")
ix.ammo.register("40mmGrenade")
ix.ammo.register("308")
ix.ammo.register("357Magnum")
ix.ammo.register("44Magnum")
ix.ammo.register("50MG")
ix.ammo.register("ElectronChargePack")
ix.ammo.register("EnergyCell")
ix.ammo.register("Flamer")
ix.ammo.register("MicrofusionCell")
ix.ammo.register("MiniNuke")
ix.ammo.register("Missile")
ix.ammo.register("FragGrenade")
ix.ammo.register("22LR")

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
