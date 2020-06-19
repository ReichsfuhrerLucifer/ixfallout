ITEM.name = "Vim"
ITEM.model = "models/mosi/fallout4/props/drink/vim.mdl"
ITEM.description = "itemVimDesc"
ITEM.price = 20
ITEM.thirst = 30

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(10)
	client:GetCharacter():GiveMoney(1)
end)