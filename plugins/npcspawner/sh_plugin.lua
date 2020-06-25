local PLUGIN = PLUGIN
PLUGIN.name = "NPC Spawner"
PLUGIN.description = "An npc spawning system."
PLUGIN.author = "ZeMysticalTaco, Frosty"
PLUGIN.npcspawners = PLUGIN.npcspawners or {}
PLUGIN.npcs = PLUGIN.npcs or {}

ix.lang.AddTable("english", {
	npcspawner = "NPC Spawner",
})

ix.lang.AddTable("korean", {
	npcspawner = "NPC 스포너",
})

ix.config.Add("NPCSpawnInterval", 300, "The font used to display titles.", nil, {
	category = "npcspawner",
	data = {min = 10, max = 999999999}
})

ix.config.Add("NPCSpawnPerWave", 5, "The font used to display titles.", nil, {
	category = "npcspawner",
	data = {min = 0, max = 1000}
})

ix.config.Add("NPCSpawnMaxNPCs", 75, "The font used to display titles.", nil, {
	category = "npcspawner",
	data = {min = 0, max = 1000}
})

ix.config.Add("NPCMinimumPlayers", 2, "The font used to display titles.", nil, {
	category = "npcspawner",
	data = {min = 0, max = 64}
})

ix.config.Add("NPCMaxInContainer", 2, "The font used to display titles.", nil, {
	category = "npcspawner",
	data = {min = 0, max = 64}
})

ix.command.Add("NPCSpawnAdd", {
	description = "Add an npc spawner.",
	adminOnly = true,
	OnRun = function(self, client)
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos
		PLUGIN:AddNPCSpawn(hitpos)
	end
})

ix.command.Add("NPCSpawnRemove", {
	description = "Add an npc spawner.",
	adminOnly = true,
	OnRun = function(self, client)
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos
		PLUGIN:RemoveNPCSpawn(client, hitpos)
	end
})

if SERVER then
	PLUGIN.customnpcs = {
	--	[""] = 70,
	}

	function PLUGIN:SaveData()
		ix.data.Set("npcspawners", self.npcspawners)
	end

	function PLUGIN:LoadData()
		self.npcspawners = ix.data.Get("npcspawners", {})
		self:PopulateNPCs()
	end



	function PLUGIN:AddNPCSpawn(client, pos)
		self.npcspawners[#self.npcspawners + 1] = pos
		client:NotifyLocalized("You have added an npc spawn.")
	end

	function PLUGIN:RemoveNPCSpawn(client, pos)
		local num = {}

		for k, v in pairs(self.npcspawners) do
			if v:Distance(pos) <= 512 then
				self.npcspawners[k] = nil
				num[#num + 1] = v
			end
		end

		client:NotifyLocalized("You have removed " .. #num .. " npc spawn(s).")
	end

	function PLUGIN:SpawnRandomNPC()
		local spawner = table.Random(self.npcspawners)

		local npc = ents.Create( table.Random(self.npcs) )
		npc:SetPos(spawner)
		npc:Spawn()
	end

	function PLUGIN:AddNPCToSpawner(id)
		PLUGIN.npcs[#PLUGIN.npcs + 1] = id
	end

	function PLUGIN:PopulateNPCs()
		for k, v in pairs(self.customnpcs) do
			for i = 1, v do
				PLUGIN:AddNPCToSpawner(k)
			end
		end
	end

	function PrintNPCPoolSize()
		print(#PLUGIN.npcs)
	end

	function PrintNPCPool()
		PrintTable(PLUGIN.npcs)
	end

	function PrintSpawnPool()
		PrintTable(PLUGIN.npcspawners)
	end

	function PLUGIN:Think()
		local frequency = ix.config.Get("NPCSpawnInterval", 300)
		local waves = ix.config.Get("NPCSpawnPerWave", 5)
		local max_npcs = ix.config.Get("NPCSpawnMaxNPCs", 75)
		local min_players = ix.config.Get("NPCMinimumPlayers", 2)

		if #self.npcspawners < 1 then return end

		if not NextNPCSpawn or NextNPCSpawn <= CurTime() then
			if #player.GetAll() >= min_players and #ents.FindByClass(self.npcs) < max_npcs then
				for i = 1, waves do
					print("NPC spawner(s) spawned npc(s).")
				end

				NextNPCSpawn = CurTime() + frequency
			end
		end
	end
end