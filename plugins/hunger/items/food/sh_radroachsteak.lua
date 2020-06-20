ITEM.name = "Radroach steak"
ITEM.model = "models/mosi/fallout4/props/food/radroachsteak.mdl"
ITEM.description = "itemRadroachSteakDesc"
ITEM.price = 7
ITEM.hunger = 30

ITEM:Hook("Eat", function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
end)