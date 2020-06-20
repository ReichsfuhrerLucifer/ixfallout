ITEM.name = "Brahmin steak"
ITEM.model = "models/mosi/fallout4/props/food/steak.mdl"
ITEM.description = "itemBrahminSteakDesc"
ITEM.price = 5
ITEM.hunger = 50
ITEM.radiation = 2

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)