
local PLUGIN = PLUGIN

PLUGIN.name = "Perma Remove"
PLUGIN.author = "alexgrist"
PLUGIN.description = "Allows staff to permenantly remove map entities."

ix.lang.AddTable("english", {
	cmdMapEntRemove = "Remove a map entity permenantly."
})

ix.lang.AddTable("korean", {
	cmdMapEntRemove = "맵 엔티티를 영구적으로 제거합니다."
})

do
	local COMMAND = {
		description = "@cmdMapEntRemove",
		superAdminOnly = true
	}

	function COMMAND:OnRun(client)
		local entity = client:GetEyeTraceNoCursor().Entity

		if (IsValid(entity) and entity:CreatedByMap()) then
			local entities = PLUGIN:GetData({})
				entities[#entities + 1] = entity:MapCreationID()
				entity:Remove()
			PLUGIN:SetData(entities)

			client:Notify("Map entity removed.")

			ix.log.Add(client, "mapEntRemoved", entity:MapCreationID(), entity:GetModel())
		else
			client:Notify("That is not a valid map entity!")
		end
	end

	ix.command.Add("MapEntRemove", COMMAND)
end

if (SERVER) then
	function PLUGIN:LoadData()
		for _, v in ipairs(self:GetData({})) do
			local entity = ents.GetMapCreatedEntity(v)

			if (IsValid(entity)) then
				entity:Remove()
			end
		end
	end

	ix.log.AddType("mapEntRemoved", function(client, index, model)
		return string.format("%s has removed map entity #%d (%s).", client:Name(), index, model)
	end)
end