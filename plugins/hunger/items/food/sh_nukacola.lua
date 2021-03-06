ITEM.name = "Nuka-Cola"
ITEM.model = "models/mosi/fallout4/props/drink/nukacola.mdl"
ITEM.description = "itemNukaColaDesc"
ITEM.price = 20
ITEM.thirst = 10
ITEM.radiation = 3
ITEM.empty = "nukacola_bottle"

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("ui/drink.wav")
	client:RestoreStamina(10)
	client:GetCharacter():GiveMoney(1)

	for i = 1, 25 do
		timer.Simple(i, function()
			client:SetHealth(math.Clamp(client:Health() + 2, 0, client:GetMaxHealth()))
		end)
	end
end)