local PLUGIN = PLUGIN
PLUGIN.name = "Data Setter"
PLUGIN.author = "some faggot, Frosty"
PLUGIN.description = "Plugin to set item data."

ix.lang.AddTable("english", {
	dataSetter = "Data set successfully.",
})
ix.lang.AddTable("korean", {
	dataSetter = "데이터가 설정되었습니다.",
})

ix.command.Add("ItemSetData", {
	adminOnly = true,
	arguments = {
		ix.type.string,
		ix.type.string
	},
	OnRun = function(self, client, key, data)
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
		local stasheditem = ix.item.instances
		
		if (!data or !isnumber(data) or data < 0) then
			return "@invalidArg", 2
		end

		for k, v in pairs(stasheditem) do
			if v:GetEntity() then
			local dist = hitpos:Distance(client:GetPos())
			local distance = v:GetEntity():GetPos():Distance( hitpos )
				if distance <= 32 then
					v:SetData(key, data)

					client:NotifyLocalized("dataSetter")
				end
			end
		end
	end
})