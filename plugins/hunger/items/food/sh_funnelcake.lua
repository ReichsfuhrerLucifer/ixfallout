ITEM.name = "Funnel cake"
ITEM.model = "models/mosi/fallout4/props/food/funnelcake.mdl"
ITEM.description = "itemFunnelCakeDesc"
ITEM.price = 18
ITEM.hunger = 10
ITEM.radiation = 4

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)