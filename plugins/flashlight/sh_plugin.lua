PLUGIN.name = "Flashlight"
PLUGIN.author = "Chessnut & Frosty"
PLUGIN.description = "Provides a flashlight item to regular flashlight usage."

function PLUGIN:PlayerSwitchFlashlight(client, state)
	local character = client:GetCharacter()

	if (!character or !character:GetInventory()) then
		return false
	end

	if (character:GetInventory():HasItem("flashlight")) then
		return true
	end
end