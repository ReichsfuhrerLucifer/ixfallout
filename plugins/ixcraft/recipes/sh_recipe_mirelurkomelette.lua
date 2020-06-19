
RECIPE.name = "Mireluck omelette"
RECIPE.description = "Cook a Mireluck omelette."
RECIPE.model = "models/mosi/fallout4/props/food/mirelurkomelette.mdl"
RECIPE.requirements = {
	["mirelurkegg"] = 1
}
RECIPE.results = {
	["mirelurkomelette"] = 1
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_cookingstation")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, L("noWorkbench")
end)
