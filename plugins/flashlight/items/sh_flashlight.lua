ITEM.name = "손전등"
ITEM.model = "models/props_combine/breenlight.mdl"
ITEM.description = "전지가 들어있는 평범한 손전등입니다."
ITEM.price = 15
ITEM.flag = "v"
ITEM.height = 1
ITEM.width = 1

ITEM:Hook("drop", function(item)
	if (item.player:FlashlightIsOn()) then
		item.player:Flashlight(false)
	end
end)

function ITEM:OnTransfered()
	local client = self:GetOwner()

	if (IsValid(client) and client:FlashlightIsOn()) then
		client:Flashlight(false)
	end
end