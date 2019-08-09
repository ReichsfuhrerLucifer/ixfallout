
ITEM.name = "itemBottlecapStarName"
ITEM.model = "models/fallout/clutter/junk/ssbottlecap01.mdl"
ITEM.description = "itemBottlecapStarDesc"
ITEM.price = 1

ITEM.functions.use = {
	OnRun = function(item)
		local client = item.player
		local character = client:GetCharacter()

		character:GiveMoney(1)
		client:NotifyLocalized("bottlecapAquired")
	end
}