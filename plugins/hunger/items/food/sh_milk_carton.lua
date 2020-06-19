ITEM.name = "Brahmin milk"
ITEM.model = "models/props_junk/garbage_milkcarton001a.mdl"
ITEM.description = "itemBrahminMilkDesc"
ITEM.category = "consumables"
ITEM.price = 20
ITEM.thirst = 10
ITEM.radiation = -25

ITEM:Hook("Eat", function(item)
	local client = item.player

	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
	client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	client:RestoreStamina(10)
end)