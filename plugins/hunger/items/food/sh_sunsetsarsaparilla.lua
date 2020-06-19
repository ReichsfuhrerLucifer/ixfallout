ITEM.name = "Sunset Sarsaparilla"
ITEM.model = "models/mosi/fallout4/props/drink/sunsetsarsaparilla.mdl"
ITEM.description = "itemSunsetSarsaparillaDesc"
ITEM.price = 3
ITEM.thirst = 25
ITEM.empty = "sunsetsarsaparilla_bottle"

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(10)
	client:GetCharacter():GiveMoney(1)
end)