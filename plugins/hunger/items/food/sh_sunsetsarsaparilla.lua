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

	local per = math.random(0, 100)

	if client:GetChar():GetAttribute("rck", 0) then
		local per = math.random(0, 100) + client:GetChar():GetAttribute("rck", 0) * ix.config.Get("luckMultiplier", 1)
	end

	if per > 95 then
		client:GetInventory():Add("bottlecap_star", 1)
	else
		client:GetCharacter():GiveMoney(1)
	end
end)