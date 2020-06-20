ITEM.name = "Brahmin meat"
ITEM.model = "models/mosi/fallout4/props/food/meat.mdl"
ITEM.description = "itemBrahminMeatDesc"
ITEM.price = 5
ITEM.hunger = 50
ITEM.radiation = 3

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)