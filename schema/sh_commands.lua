
do
	local COMMAND = {}
	COMMAND.arguments = ix.type.text

	function COMMAND:OnRun(client, message)
		local character = client:GetCharacter()
		local radios = character:GetInventory():GetItemsByUniqueID("handheld_radio", true)
		local item

		for k, v in ipairs(radios) do
			if (v:GetData("enabled", false)) then
				item = v
				break
			end
		end

		if (item) then
			if (!client:IsRestricted()) then
				ix.chat.Send(client, "radio", message)
				ix.chat.Send(client, "radio_eavesdrop", message)
			else
				return "@notNow"
			end
		elseif (#radios > 0) then
			return "@radioNotOn"
		else
			return "@radioRequired"
		end
	end

	ix.command.Add("Radio", COMMAND)
end

do
	local COMMAND = {}
	COMMAND.arguments = ix.type.number

	function COMMAND:OnRun(client, frequency)
		local character = client:GetCharacter()
		local inventory = character:GetInventory()
		local itemTable = inventory:HasItem("handheld_radio")

		if (itemTable) then
			if (string.find(frequency, "^%d%d%d%.%d$")) then
				character:SetData("frequency", frequency)
				itemTable:SetData("frequency", frequency)

				client:NotifyLocalized("freqSet", frequency)
			end
		end
	end

	ix.command.Add("SetFreq", COMMAND)
end

do
	local COMMAND = {}

	function COMMAND:OnRun(client, arguments)
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector() * 96
			data.filter = client
		local target = util.TraceLine(data).Entity

		if (IsValid(target) and target:IsPlayer() and target:IsRestricted()) then
			if (!client:IsRestricted()) then
				Schema:SearchPlayer(client, target)
			else
				return "@notNow"
			end
		end
	end

	ix.command.Add("CharSearch", COMMAND)
end

ix.command.Add("CharSpawn", {
	adminOnly = true,
	arguments = {
		ix.type.player
	},
	OnRun = function(self, client, target)
		target:Spawn()
		
		if client == target then
            client:NotifyLocalized("charSpawn01")
        else
            client:NotifyLocalized("charSpawn02", target:GetName())
            target:NotifyLocalized("charSpawn03", client:GetName())
        end
	end
})

ix.command.Add("Revive", {
	adminOnly = true,
	arguments = {
		ix.type.player
	},
	OnRun = function(self, client, target)
		local pos = target:GetPos()
		target:Spawn()
		target:SetPos(pos)
		
		if client == target then
            client:NotifyLocalized("revive01")
        else
            client:NotifyLocalized("revive02", target:GetName())
            target:NotifyLocalized("revive03", client:GetName())
        end
	end
})

ix.command.Add("GiveCaps", {
	description = "@cmdGiveMoney",
	arguments = ix.type.number,
	OnRun = function(self, client, amount)
		amount = math.floor(amount)

		if (amount <= 0) then
			return L("invalidArg", client, 1)
		end

		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector() * 96
			data.filter = client
		local target = util.TraceLine(data).Entity

		if (IsValid(target) and target:IsPlayer() and target:GetCharacter()) then
			if (!client:GetCharacter():HasMoney(amount)) then
				return
			end

			target:GetCharacter():GiveMoney(amount)
			client:GetCharacter():TakeMoney(amount)

			target:NotifyLocalized("moneyTaken", ix.currency.Get(amount))
			client:NotifyLocalized("moneyGiven", ix.currency.Get(amount))
		end
	end
})

ix.command.Add("CharSetCaps", {
	description = "@cmdCharSetMoney",
	superAdminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.number
	},
	OnRun = function(self, client, target, amount)
		amount = math.Round(amount)

		if (amount <= 0) then
			return "@invalidArg", 2
		end

		target:SetMoney(amount)
		client:NotifyLocalized("setMoney", target:GetName(), ix.currency.Get(amount))
	end
})

ix.command.Add("DropCaps", {
	description = "@cmdDropMoney",
	arguments = ix.type.number,
	OnRun = function(self, client, amount)
		amount = math.Round(amount)

		if (amount <= 0) then
			return "@invalidArg", 1
		end

		if (!client:GetCharacter():HasMoney(amount)) then
			return "@insufficientMoney"
		end

		client:GetCharacter():TakeMoney(amount)

		local money = ix.currency.Spawn(client, amount)
		money.ixCharID = client:GetCharacter():GetID()
		money.ixSteamID = client:SteamID()
	end
})