
RECIPE.name = "Deathclaw omelette"
RECIPE.description = "Cook a Deathclaw omelette."
RECIPE.model = "models/mosi/fallout4/props/food/deathclawomelette.mdl"
RECIPE.requirements = {
	["deathclawegg"] = 1
}
RECIPE.results = {
	["deathclawomelette"] = 1
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, L("noWorkbench")
end)
