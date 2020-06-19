ITEM.name = "Vim Captain's Blend"
ITEM.model = "models/mosi/fallout4/props/drink/vim.mdl"
ITEM.description = "itemVimCaptainDesc"
ITEM.skin = 2
ITEM.price = 50
ITEM.thirst = 30

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(20)
	client:GetCharacter():GiveMoney(1)
end)