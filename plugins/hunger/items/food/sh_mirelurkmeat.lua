ITEM.name = "Mirelurk meat"
ITEM.model = "models/mosi/fallout4/props/food/mirelurkroast.mdl"
ITEM.description = "itemMirelurkMeatDesc"
ITEM.price = 20
ITEM.hunger = 20
ITEM.radiation = 2

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)