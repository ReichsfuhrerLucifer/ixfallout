ITEM.name = "Paper Base"
--ITEM.uniqueID = "misc_paper"
ITEM.model = "models/props_c17/paper01.mdl"
ITEM.description = "A piece of paper that you can write on.\nPrivate Note: Only you can edit texts.\nPublic Note: Anyone can edit texts."
ITEM.flag = "v"
ITEM.price = 1
ITEM.maxStack = 10
--ITEM.functions = {}
ITEM.functions.Private = {
	name = "Write (Private)",
	icon = "icon16/page_white_paintbrush.png",
	OnRun = function(item)
		local client = item.player

		local position
		if (IsValid(entity)) then
			position = entity:GetPos() + Vector(0, 0, 4)
		else
			local data2 = {
				start = client:GetShootPos(),
				endpos = client:GetShootPos() + client:GetAimVector() * 72,
				filter = client
			}
			local trace = util.TraceLine(data2)
			position = trace.HitPos + Vector(0, 0, 16)
		end
			
		local entity2 = entity
		local entity = ents.Create("ix_paper")
		entity:SetPos(position)
		if (IsValid(entity2)) then
			entity:SetAngles(entity2:GetAngles())
		end
		entity:SetNetVar( "owner", client:SteamID() )
		entity:SetNetVar( "private", true )
		entity:Spawn()
		entity:Activate()
		entity:SetCreator(client)
			
		if(item:GetData("Amount", 0) > 1) then --for stacked
			item:SetData("Amount", item:GetData("Amount") - 1)
			return false
		else
			return true
		end
	end
}
ITEM.functions.Public = {
	name = "Write (Public)",
	icon = "icon16/page_white_paint.png",
	OnRun = function(item)
		local client = item.player
		local position
		
		if (IsValid(entity)) then
			position = entity:GetPos() + Vector(0, 0, 4)
		else
			local data2 = {
				start = client:GetShootPos(),
				endpos = client:GetShootPos() + client:GetAimVector() * 72,
				filter = client
			}
			local trace = util.TraceLine(data2)
			position = trace.HitPos + Vector(0, 0, 16)
		end
		
		local entity2 = entity
		local entity = ents.Create("ix_paper")
		entity:SetPos(position)
		if (IsValid(entity2)) then
			entity:SetAngles(entity2:GetAngles())
		end
		entity:SetNetVar( "owner", client )
		entity:SetNetVar( "private", false )
		entity:Spawn()
		entity:Activate()
		entity:SetCreator(client)

		if(item:GetData("Amount", 0) > 1) then --for stacked
			item:SetData("Amount", item:GetData("Amount") - 1)
			return false
		else
			return true
		end
	end
}