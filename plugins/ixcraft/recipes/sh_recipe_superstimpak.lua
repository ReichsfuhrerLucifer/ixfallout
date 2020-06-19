
RECIPE.name = "Super stimpak"
RECIPE.description = "Make a super stimpak."
RECIPE.model = "models/mosi/fallout4/props/aid/stimpak.mdl"
RECIPE.requirements = {
	["stimpak"] = 1,
	["nukacola"] = 1,
	["mutfruit"] = 1
}
RECIPE.results = {
	["super_stimpak"] = 1
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, L("noWorkbench")
end)
