
RECIPE.name = "BlamCo Mac & Cheese"
RECIPE.description = "recipeMacAndCheeseDesc"
RECIPE.category = "Food"
RECIPE.model = "models/mosi/fallout4/props/food/macandcheese.mdl"
RECIPE.requirements = {
	["macandcheese_irradiated"] = 2
}
RECIPE.results = {
	["macandcheese"] = {["min"] = 1, ["max"] = 2}
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_chemistrystation")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, L("noWorkbench")
end)
