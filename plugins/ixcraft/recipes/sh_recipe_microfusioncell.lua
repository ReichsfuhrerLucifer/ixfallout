
RECIPE.name = "Mircrofusion cell"
RECIPE.description = "recipeMicrofusionCellDesc"
RECIPE.model = "models/mosi/fallout4/props/ammo/microfusioncell.mdl"
RECIPE.requirements = {
	["energycell"] = 1
}
RECIPE.results = {
	["microfusioncell"] = 1
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_weaponsworkbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, L("noWorkbench")
end)
