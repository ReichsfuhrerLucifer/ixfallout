ITEM.name = "제트"
ITEM.model = "models/mosi/fallout4/props/aid/jet.mdl"
ITEM.description = "뉴 레노의 마이론이라는 자가 만들어 낸 강력한 마약으로 브라민의 배설물을 증류하여 만듭니다.\n스태미너를 즉시 30 회복합니다."
ITEM.price = 20
ITEM.category = "Medical"

ITEM.functions.Apply = {
	name = "흡입하기",
	OnRun = function(item)
		local client = item.player
		local character = client:GetCharacter()
		local agi = character:GetAttribute("agi", 0)
			
		client:EmitSound("ui/using_jet.wav")
		client:RestoreStamina(math.min(30 + int, 100))
		character:SetAttrib("agi", agi + 0.2)
	end
}