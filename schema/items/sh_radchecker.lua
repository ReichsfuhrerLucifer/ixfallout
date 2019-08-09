
ITEM.name = "방사능 수치 측정기"
ITEM.description = "누군가의 방사능 수치를 측정할 때 사용합니다."
ITEM.price = 150
ITEM.model = "models/gibs/shield_scanner_gib1.mdl"

ITEM.functions.Use = {
	name = "측정하기",
	OnRun = function(itemTable)
		local client = itemTable.player
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector() * 96
			data.filter = client
		local target = util.TraceLine(data).Entity

		if (IsValid(target) and target:IsPlayer() and target:GetCharacter()) then
			local radiation = target:GetRadiation()
			
			client:EmitSound("tools/ifm/beep.wav")
			client:ConCommand("say /me 방사능 수치 측정기로 "..target:GetName().."의 방사능 수치를 측정합니다.") 
			client:Notify("측정 대상의 방사능 수치는 ("..radiation..") 입니다.")
			target:Notify(client:GetName().."님이 당신의 방사능 수치를 측정했습니다.")
		else
			itemTable.player:NotifyLocalized("plyNotValid")
		end

		return false
	end
}

ITEM.functions.Self = {
	name = "자가 측정하기",
	OnRun = function(itemTable)
		local client = itemTable.player

		if (IsValid(client) and client:IsPlayer() and client:GetCharacter()) then
			local radiation = client:GetRadiation()
			
			client:EmitSound("tools/ifm/beep.wav")
			client:ConCommand("say /me 방사능 수치 측정기로 자신의 방사능 수치를 측정합니다.") 
			client:Notify("당신의 방사능 수치는 ("..radiation..") 입니다.")
		else
			itemTable.player:NotifyLocalized("plyNotValid")
		end

		return false
	end
}