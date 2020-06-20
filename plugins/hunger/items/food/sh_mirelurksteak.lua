ITEM.name = "Roasted mirelurk meat"
ITEM.model = "models/mosi/fallout4/props/food/mirelurkroast.mdl"
ITEM.skin = 1
ITEM.description = "itemMirelurkSteakDesc"
ITEM.price = 40
ITEM.hunger = 70

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)