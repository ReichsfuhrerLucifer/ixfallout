Schema.name = "Fallout RP"
Schema.author = "Frosty"
Schema.description = "전쟁, 전쟁은 결코 변하지 않는다..."

------------------
--[[ INCLUDES ]]--
------------------
ix.util.Include("libs/thirdparty/sh_netstream2.lua")
ix.util.Include("sh_commands.lua")
ix.util.Include("sv_schema.lua")

ix.util.IncludeDir("hooks")

------------------
--[[ ANIMATION ]]--
------------------
ix.anim.SetModelClass("models/adi/t601_losthills_pm.mdl", "player")
ix.anim.SetModelClass("models/adi/t601_rustvar2_pm.mdl", "player")
ix.anim.SetModelClass("models/kuma96/hazmatsuit_female/hazmatsuit_female_pm.mdl", "player")
ix.anim.SetModelClass("models/kuma96/hazmatsuit_male/hazmatsuit_male_pm.mdl", "player")

-----------------------
--[[ FUNCTIONS ]]--
-----------------------
function Schema:ZeroNumber(number, length)
	local amount = math.max(0, length - string.len(number))
	return string.rep("0", amount)..tostring(number)
end

-----------------------
--[[ CONFIGURATION ]]--
-----------------------
ix.currency.Set("","병뚜껑", "병뚜껑")

ix.config.SetDefault("color", Color(205, 133, 63, 255))
ix.config.SetDefault("font", "Malgun Gothic")
ix.config.SetDefault("genericFont", "Malgun Gothic")

ix.config.Add("moneyModel", "models/fallout_4/props/bottlecaptin.mdl", "The model of the money when is dropped.", nil, {category = "appearance"})
ix.config.SetDefault("moneyModel", "models/fallout_4/props/bottlecaptin.mdl")

---------------
--[[ FILES ]]--
---------------
if (SERVER) then
	-- resource.AddWorkshop("891790188") -- Fallout 3 Custom Backpacks
	-- resource.AddWorkshop("203873185") -- Fallout Collection: Aid Props
end

do
	local CLASS = {}
	CLASS.color = Color(75, 150, 50)
	CLASS.format = "%s says on radio \"%s\""

	function CLASS:CanHear(speaker, listener)
		local character = listener:GetCharacter()
		local inventory = character:GetInventory()
		local bHasRadio = false

		for k, v in pairs(inventory:GetItemsByUniqueID("handheld_radio", true)) do
			if (v:GetData("enabled", false) and speaker:GetCharacter():GetData("frequency") == character:GetData("frequency")) then
				bHasRadio = true
				break
			end
		end

		return bHasRadio
	end

	function CLASS:OnChatAdd(speaker, text)
		text = text
		chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
	end

	ix.chat.Register("radio", CLASS)
end

do
	local CLASS = {}
	CLASS.color = Color(255, 255, 175)
	CLASS.format = "%s 님의 무전 \"%s\""

	function CLASS:GetColor(speaker, text)
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			return Color(175, 255, 175)
		end

		return self.color
	end

	function CLASS:CanHear(speaker, listener)
		if (ix.chat.classes.radio:CanHear(speaker, listener)) then
			return false
		end

		local chatRange = ix.config.Get("chatRange", 280)

		return (speaker:GetPos() - listener:GetPos()):LengthSqr() <= (chatRange * chatRange)
	end

	function CLASS:OnChatAdd(speaker, text)
		text = text
		chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
	end

	ix.chat.Register("radio_eavesdrop", CLASS)
end