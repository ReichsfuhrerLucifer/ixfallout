ITEM.name = "스텔스 보이"
ITEM.model = "models/mosi/fallout4/props/aid/stealthboy.mdl"
ITEM.description = "사용자에게 은폐장을 씌워 일정 시간 동안 거의 보이지 않게 만들어 줍니다."
ITEM.price = 100

ITEM.functions.Apply = {
	name = "사용하기",
	OnRun = function(item)
		local client = item.player
		local oldColor = client:GetColor() or Color( 255, 255, 255, 255 )
		local stealthColor = Color( 255, 255, 255, 25 )
		
		client:SetColor(stealthColor)
		client:SetRenderMode( RENDERMODE_TRANSALPHA )
		client:SetNoTarget(true)
		client:DrawShadow(false)
		client:EmitSound("items/suitchargeok1.wav")
		
		timer.Simple(120, function()
			client:SetColor(oldColor)
			client:EmitSound("items/suitchargeno1.wav")
			client:SetRenderMode( RENDERMODE_TRANSALPHA )
			client:SetNoTarget(false)
			client:DrawShadow(true)
		end)
	end
}