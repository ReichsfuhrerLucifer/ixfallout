ITEM.name = "Mirelurk omelette"
ITEM.model = "models/mosi/fallout4/props/food/mirelurkomelette.mdl"
ITEM.description = "itemMirelurkOmeletteDesc"
ITEM.price = 30
ITEM.hunger = 45

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(50)
end)