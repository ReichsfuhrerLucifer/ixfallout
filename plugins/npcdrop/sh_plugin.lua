
local PLUGIN = PLUGIN
PLUGIN.name = "NPC Item Drop"
PLUGIN.author = "Halokiller38, Frosty"
PLUGIN.desc = "This plugin makes it when you kill a npc it drops a random item from the list."

function PLUGIN:OnNPCKilled(entity, client)
	local class = entity:GetClass()
	local model = entity:GetModel()
	local skin = entity:GetSkin()
	
	local Gecko = {"geckomeat"}
	local GeckoItems = table.Random(Gecko)
	
	local Mirelurk = {"mirelurkmeat", "mirelurkegg"}
	local MirelurkItems = table.Random(Mirelurk)
	
	local NukaCola = {"nukacola", "nukacola_quantom", "nukacola_quartz", "nukacola_victory", "nukacola_wild"}
	local NukaColaItems = table.Random(NukaCola)
	
	local Deathclaw = {"deathclawmeat"}
	local DeathclawItems = table.Random(Deathclaw)
	
	local Ghoul = {"humanmeat", "money"}
	local GhoulItems = table.Random(Ghoul)
	
	local IrradiatedPreWarFoods = {"cram_irradiated", "dandyboyapples_irradiated", "fancyladcakes_irradiated", "instamash_irradiated", "macandcheese_irradiated", "porkbeans_irradiated", "potatocrisps_irradiated", "sugarbombs_irradiated"}
	local IrradiatedPreWarFoodsItems = table.Random(IrradiatedPreWarFoods)
	
	local Gutsy = {"energycell", "microfusioncell"}
	local GutsyItems = table.Random(Gutsy)
	
	local rnd = math.random(1, 100)

	if client:GetCharacter() then
		local luck = client:GetCharacter():GetAttribute("lck", 0)
		local luckMult = ix.config.Get("luckMultiplier", 1)
	end
	
	if (luck) then
		rnd = math.min(math.random(1, 100) + luck * luckMult, 100)
	end
	
	if (class == "npc_gecko" or class == "npc_gecko_fire" or class == "npc_gecko_golden" or class == "npc_gecko_green") then
		if (rnd >= 30) then
			ix.item.Spawn(GeckoItems, entity:GetPos() + Vector(0, 0, 16))
		end
	elseif (class == "npc_gecko_gojira") then
		ix.item.Spawn(GeckoItems, entity:GetPos() + Vector(0, 0, 16))
		ix.item.Spawn(GeckoItems, entity:GetPos() + Vector(0, 0, 16))
		ix.item.Spawn(GeckoItems, entity:GetPos() + Vector(0, 0, 16))
		ix.item.Spawn(GeckoItems, entity:GetPos() + Vector(0, 0, 16))
		ix.item.Spawn(GeckoItems, entity:GetPos() + Vector(0, 0, 16))
		ix.item.Spawn(GeckoItems, entity:GetPos() + Vector(0, 0, 16))
		ix.item.Spawn(GeckoItems, entity:GetPos() + Vector(0, 0, 16))
		ix.item.Spawn(GeckoItems, entity:GetPos() + Vector(0, 0, 16))
	elseif (class == "npc_mirelurk" or class == "npc_swamplurk") then
		if (rnd >= 30) then
			ix.item.Spawn(MirelurkItems, entity:GetPos() + Vector(0, 0, 16))
		end
	elseif (class == "npc_swamplurk" or class == "npc_magmalurk") then
		if (rnd >= 30) then
			ix.item.Spawn(MirelurkItems, entity:GetPos() + Vector(0, 0, 16))
			ix.item.Spawn(MirelurkItems, entity:GetPos() + Vector(0, 0, 16))
			ix.item.Spawn(MirelurkItems, entity:GetPos() + Vector(0, 0, 16))
		end
	elseif (class == "npc_nukalurk") then
		if (rnd >= 30) then
			ix.item.Spawn(MirelurkItems, entity:GetPos() + Vector(0, 0, 16))
		end
		ix.item.Spawn(NukaColaItems, entity:GetPos() + Vector(0, 0, 16))
	elseif (class == "npc_deathclaw_baby") then
		ix.item.Spawn(DeathclawItems, entity:GetPos() + Vector(0, 0, 16))
	elseif (class == "npc_deathclaw" or class == "npc_deathclaw_alphamale") then
		ix.item.Spawn(DeathclawItems, entity:GetPos() + Vector(0, 0, 16))
		ix.item.Spawn(DeathclawItems, entity:GetPos() + Vector(0, 0, 16))
	elseif (class == "npc_deathclaw_mother") then
		ix.item.Spawn(DeathclawItems, entity:GetPos() + Vector(0, 0, 16))
		ix.item.Spawn("deathclawegg", entity:GetPos() + Vector(0, 0, 16))
	elseif (class == "npc_ghoulferal" or class == "npc_ghoulferal_jumpsuit" or class == "npc_ghoulferal_reaver" or class == "npc_ghoulferal_roamer" or class == "npc_ghoulferal_trooper" or class == "npc_ghoulferal_trooper_gl" or class == "npc_ghoulferal_glowingone" or class == "npc_ghoulferal_jumpsuit_gl") then
		if (rnd >= 90) then
			ix.item.Spawn("combat_armor", entity:GetPos() + Vector(0, 0, 16))
		elseif (rnd >= 30) then
			ix.item.Spawn(GhoulItems, entity:GetPos() + Vector(0, 0, 16))
			ix.item.Spawn(IrradiatedPreWarFoodsItems, entity:GetPos() + Vector(0, 0, 16))
		end
	elseif (class == "npc_mrgutsy_army") then
		if (rnd >= 30) then
			ix.item.Spawn(GutsyItems, entity:GetPos() + Vector(0, 0, 16))
			ix.item.Spawn(GutsyItems, entity:GetPos() + Vector(0, 0, 16))
			ix.item.Spawn(GutsyItems, entity:GetPos() + Vector(0, 0, 16))
		end
	end
end

function PLUGIN:PlayerDeath(client)
	local rnd = math.random(1, 100)
	
	if client:GetCharacter() then
		local luck = client:GetCharacter():GetAttribute("lck", 0)
		local luckMult = ix.config.Get("luckMultiplier", 1)
	end

	if (luck) then
		rnd = math.min(math.random(1, 100) + luck * luckMult, 100)
	end

	if (rnd >= 60) then
		ix.item.Spawn("humanmeat", client:GetPos() + Vector(0, 0, 16))
	end
end
