
PLUGIN.name = "Talking NPCs"
PLUGIN.author = "Black Tea (NS 1.0), Neon (NS 1.1), Frosty (Helix)"
PLUGIN.description = "Adding talking NPCs."
PLUGIN.chatDelay = { min = .5, max = 1 }
PLUGIN.defaultDialogue = {
	npc = {
		["_start"] = "Hello, This is default Text.",
		["test1"] = "He is also known as 'Black Tea'. He is really famous for incredible sucky coding skill and not working buggy code. Long time ago, I suggested him to kill himself but he refused.",
	},
	player = {
		["_quit"] = "I gotta go.",
		["test1"] = "Can you tell me who is rebel1324?",
	},
}

if (SERVER) then
	local PLUGIN = PLUGIN
	
	function PLUGIN:SaveData()
		local data = {}
			for k, v in ipairs(ents.FindByClass("ix_talker")) do
				local bodygroups = {}

				for _, v2 in ipairs(entity:GetBodyGroups() or {}) do
					bodygroups[v2.id] = entity:GetBodygroup(v2.id)
				end

				data[#data + 1] = {
					name = v:GetNetVar("name"),
					description = v:GetNetVar("description"),
					pos = v:GetPos(),
					angles = v:GetAngles(),
					model = v:GetModel(),
					skin = v:GetSkin(),
					bodygroups = bodygroups,
					factions = v:GetNetVar("factiondata", {}),
					dialogue = v:GetNetVar( "dialogue", self.defaultDialogue ),
					classes = v:GetNetVar("classdata", {})
				}
			end
		self:SetData(data)
	end

	function PLUGIN:LoadData()
		for k, v in ipairs(self:getData() or {}) do
			local entity = ents.Create("ix_talker")
			entity:SetPos(v.pos)
			entity:SetAngles(v.angles)
			entity:Spawn()
			entity:SetModel(v.model)
			entity:SetSkin(v.skin)

			for id, bodygroup in pairs(v.bodygroups or {}) do
				entity:SetBodygroup(id, bodygroup)
			end

			entity:SetNetVar("dialogue", v.dialogue)
			entity:SetNetVar("factiondata", v.factions)
			entity:SetNetVar("classdata", v.classes)
			entity:SetNetVar("name", v.name)
			entity:SetNetVar("description", v.description)
		end
	end
end