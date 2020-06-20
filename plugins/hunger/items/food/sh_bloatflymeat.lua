ITEM.name = "Bloatfly meat"
ITEM.model = "models/mosi/fallout4/props/food/bloatflymeat.mdl"
ITEM.description = "itemBloatflyMeatDesc"
ITEM.price = 4
ITEM.hunger = 25
ITEM.radiation = 3

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)