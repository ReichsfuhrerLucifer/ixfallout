ITEM.name = "우유"
ITEM.model = "models/props_junk/garbage_milkcarton001a.mdl"
ITEM.description = "종이갑에 우유가 들어있습니다."
ITEM.category = "consumables"
ITEM.hunger = 10
ITEM.thirst = 70

ITEM:Hook("eat", function(item)
	local client = item.player
	client:EmitSound("npc/barnacle/barnacle_gulp2.wav")
end)