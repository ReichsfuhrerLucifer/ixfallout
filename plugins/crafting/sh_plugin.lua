--TODO: POPULATE CRAFTING ITEMS AND RECIPES
PLUGIN.name = "Crafting"
PLUGIN.author = "ZeMysticalTaco"
PLUGIN.desc = "Replacing the business menu with crafting because that's a more sensible thing to do."
STORED_RECIPES = {}

function PLUGIN:AddRecipe(name, model, desc, requirements, results, id, skill, blueprint, entity, category)
	if type(name) ~= "table" then
		local RECIPE = {}
		RECIPE["id"] = id --Unique ID of the recipe.
		RECIPE["name"] = name -- Name of the recipe.
		RECIPE["model"] = model -- Model it uses in the menu.
		RECIPE["desc"] = desc -- Description of what it is.
		RECIPE["req"] = requirements --Requirements to craft it(use item id's)
		RECIPE["results"] = results --Results of the craft (use item id's)
		RECIPE["blueprint"] = blueprint or false
		RECIPE["entity"] = entity or false
		RECIPE["category"] = category or "Miscellaneous"

		if skill then
			RECIPE["skill"] = skill
		end

		STORED_RECIPES[id] = RECIPE
	else
		for k, v in pairs(name) do
		RECIPE["id"] = k --Unique ID of the recipe.
		RECIPE["name"] = v.name -- Name of the recipe.
		RECIPE["model"] = v.model -- Model it uses in the menu.
		RECIPE["desc"] = v.desc -- Description of what it is.
		RECIPE["req"] = v.requirements --Requirements to craft it(use item id's)
		RECIPE["results"] = v.results --Results of the craft (use item id's)
		RECIPE["blueprint"] = v.blueprint or false --Whether or not it uses a blueprint
		RECIPE["entity"] = v.entity or false --FUTURE: Whether or not it will use an entity.
		RECIPE["category"] = v.category or "Miscellaneous" --FUTURE: The Category

		end
	end
end
--[[-------------------------------------------------------------------------
TODO: For release, demonstrate full capacity of plugin.
---------------------------------------------------------------------------]]
local NEW_RECIPES = {
	["gecko_steak"] = {
		["name"] = "겍코 스테이크",
		["model"] = "models/mosi/fallout4/props/food/radroachsteak.mdl",
		["desc"] = "겍코 고기를 구워 스테이크를 만듭니다.",
		["requirements"] = {["geckomeat"] = 1},
		["results"] = {["geckosteak"] = 1},
		["category"] = "조리",
	},
	["brahmin_steak"] = {
		["name"] = "브라민 스테이크",
		["model"] = "models/mosi/fallout4/props/food/steak.mdl",
		["desc"] = "브라민 고기를 구워 스테이크를 만듭니다.",
		["requirements"] = {["brahminmeat"] = 1},
		["results"] = {["brahminsteak"] = 1},
		["category"] = "조리",
	},
	["dog_steak"] = {
		["name"] = "개고기 스테이크",
		["model"] = "models/mosi/fallout4/props/food/dogmeat.mdl",
		["desc"] = "개고기를 구워 스테이크를 만듭니다.",
		["requirements"] = {["dogmeat"] = 1},
		["results"] = {["dogsteak"] = 1},
		["category"] = "조리",
	},
	["molerat_steak"] = {
		["name"] = "땅두더지 스테이크",
		["model"] = "models/mosi/fallout4/props/food/moleratsteak.mdl",
		["desc"] = "땅두더지 고기를 구워 스테이크를 만듭니다.",
		["requirements"] = {["moleratmeat"] = 1},
		["results"] = {["moleratsteak"] = 1},
		["category"] = "조리",
	},
	["radroach_steak"] = {
		["name"] = "라드로치 스테이크",
		["model"] = "models/mosi/fallout4/props/food/radroachsteak.mdl",
		["desc"] = "라드로치 고기를 구워 스테이크를 만듭니다.",
		["requirements"] = {["radroachmeat"] = 1},
		["results"] = {["radroachsteak"] = 1},
		["category"] = "조리",
	},
	["radscorpion_steak"] = {
		["name"] = "라드스콜피온 스테이크",
		["model"] = "models/mosi/fallout4/props/food/radscorpionsteak.mdl",
		["desc"] = "라드스콜피온 고기를 구워 스테이크를 만듭니다.",
		["requirements"] = {["radscorpionmeat"] = 1},
		["results"] = {["radscorpionsteak"] = 1},
		["category"] = "조리",
	},
	["human_steak"] = {
		["name"] = "인육",
		["model"] = "models/mosi/fallout4/props/food/humanmeat.mdl",
		["desc"] = "대체 왜 이걸 조리해 먹으려고 하는 겁니까.",
		["requirements"] = {["humanmeat"] = 1},
		["results"] = {["humansteak"] = 1},
		["category"] = "조리",
	},
	["mirelurk_omelette"] = {
		["name"] = "마이얼럭 오믈렛",
		["model"] = "models/mosi/fallout4/props/food/mirelurkomelette.mdl",
		["desc"] = "마이얼럭 알을 조리해 오믈렛을 만듭니다.",
		["requirements"] = {["mirelurkegg"] = 1},
		["results"] = {["mirelurkomelette"] = 1},
		["category"] = "조리",
	},
	["deathclaw_omelette"] = {
		["name"] = "데스클로 오믈렛",
		["model"] = "models/mosi/fallout4/props/food/deathclawomelette.mdl",
		["desc"] = "데스클로 알을 조리해 오믈렛을 만듭니다.",
		["requirements"] = {["deathclawegg"] = 1},
		["results"] = {["deathclawomelette"] = 1},
		["category"] = "조리",
	},
	["bandage"] = {
		["name"] = "붕대",
		["model"] = "models/props_lab/box01a.mdl",
		["desc"] = "전쟁 전 화폐를 이용해 붕대를 만듭니다.",
		["requirements"] = {["money"] = 2},
		["results"] = {["bandage"] = 1},
		["category"] = "의학",
	},
	["super_stimpak"] = {
		["name"] = "슈퍼 스팀팩",
		["model"] = "models/mosi/fallout4/props/aid/stimpak.mdl",
		["desc"] = "스팀팩, 누카 콜라, 뮤트푸르트를 조합하여 슈퍼 스팀팩을 만듭니다.",
		["requirements"] = {["stimpak"] = 1, ["nukacola"] = 1, ["mutfruit"] = 1},
		["results"] = {["super_stimpak"] = 1},
		["category"] = "의학",
	},
	["water"] = {
		["name"] = "깨끗한 물",
		["model"] = "models/mosi/fallout4/props/drink/water.mdl",
		["desc"] = "더러운 물을 정화합니다.",
		["requirements"] = {["dirtywater"] = 2},
		["results"] = {["water"] = 1},
		["category"] = "정화",
	},
	["cram"] = {
		["name"] = "크램",
		["model"] = "models/mosi/fallout4/props/food/cram.mdl",
		["desc"] = "오염된 크램을 정화합니다.",
		["requirements"] = {["cram_irradiated"] = 2},
		["results"] = {["cram"] = 1},
		["category"] = "정화",
	},
	["dandyboyapples"] = {
		["name"] = "댄디보이 애플",
		["model"] = "models/mosi/fallout4/props/food/dandyboyapples.mdl",
		["desc"] = "오염된 댄디보이 애플을 정화합니다.",
		["requirements"] = {["dandyboyapples_irradiated"] = 2},
		["results"] = {["dandyboyapples"] = 1},
		["category"] = "정화",
	},
	["fancyladcakes"] = {
		["name"] = "팬시 라드 스낵 케이크",
		["model"] = "models/mosi/fallout4/props/food/fancyladcakes.mdl",
		["desc"] = "오염된 팬시 라드 스낵 케이크를 정화합니다.",
		["requirements"] = {["fancyladcakes_irradiated"] = 2},
		["results"] = {["fancyladcakes"] = 1},
		["category"] = "정화",
	},
	["instamash"] = {
		["name"] = "인스타 매쉬",
		["model"] = "models/mosi/fallout4/props/food/instamash.mdl",
		["desc"] = "오염된 인스타 매쉬를 정화합니다.",
		["requirements"] = {["instamash_irradiated"] = 2},
		["results"] = {["instamash"] = 1},
		["category"] = "정화",
	},
	["macandcheese"] = {
		["name"] = "블람코 마카로니 & 치즈",
		["model"] = "models/mosi/fallout4/props/food/macandcheese.mdl",
		["desc"] = "오염된 블람코 마카로니 & 치즈를 정화합니다.",
		["requirements"] = {["macandcheese_irradiated"] = 2},
		["results"] = {["macandcheese"] = 1},
		["category"] = "정화",
	},
	["porknbeans"] = {
		["name"] = "포크 & 빈즈",
		["model"] = "models/mosi/fallout4/props/food/porknbeans.mdl",
		["desc"] = "오염된 포크 & 빈즈를 정화합니다.",
		["requirements"] = {["porkbeans_irradiated"] = 2},
		["results"] = {["porkbeans"] = 1},
		["category"] = "정화",
	},
	["potatocrisps"] = {
		["name"] = "감자칩",
		["model"] = "models/mosi/fallout4/props/food/potatocrisps.mdl",
		["desc"] = "오염된 감자칩을 정화합니다.",
		["requirements"] = {["potatocrisps_irradiated"] = 2},
		["results"] = {["potatocrisps"] = 1},
		["category"] = "정화",
	},
	["salisburysteak"] = {
		["name"] = "솔즈베리 스테이크",
		["model"] = "models/mosi/fallout4/props/food/salisburysteak.mdl",
		["desc"] = "오염된 솔즈베리 스테이크를 정화합니다.",
		["requirements"] = {["steak_irradiated"] = 2},
		["results"] = {["steak"] = 1},
		["category"] = "정화",
	},
	["sugarbombs"] = {
		["name"] = "슈가밤",
		["model"] = "models/mosi/fallout4/props/food/sugarbombs.mdl",
		["desc"] = "오염된 슈가밤을 정화합니다.",
		["requirements"] = {["sugarbombs_irradiated"] = 2},
		["results"] = {["sugarbombs"] = 1},
		["category"] = "정화",
	},
	["yumyumdeviledeggs"] = {
		["name"] = "얌얌 악마알",
		["model"] = "models/mosi/fallout4/props/food/yumyumdeviledeggs.mdl",
		["desc"] = "오염된 얌얌 악마알을 정화합니다.",
		["requirements"] = {["yumyumdeviledeggs_irradiated"] = 2},
		["results"] = {["yumyumdeviledeggs"] = 1},
		["category"] = "정화",
	},
	["energycell_to_microfusioncell"] = {
		["name"] = "에너지 셀 → 마이크로퓨전 셀",
		["model"] = "models/mosi/fallout4/ammo/microfusioncell.mdl",
		["desc"] = "에너지 셀을 마이크로퓨전 셀로 변환합니다.",
		["requirements"] = {["energycell"] = 1},
		["results"] = {["microfusioncell"] = 1},
		["category"] = "탄약",
	},
	["microfusioncell_to_energycell"] = {
		["name"] = "마이크로퓨전 셀 → 에너지 셀",
		["model"] = "models/maxibammo/energycell.mdl",
		["desc"] = "마이크로퓨전 셀을 에너지 셀로 변환합니다.",
		["requirements"] = {["microfusioncell"] = 1},
		["results"] = {["energycell"] = 1},
		["category"] = "탄약",
	},
	["microfusioncell_to_electronchargepack"] = {
		["name"] = "마이크로퓨전 셀 → 일렉트론 차지 팩",
		["model"] = "models/maxibammo/electronchargepack.mdl",
		["desc"] = "마이크로퓨전 셀을 일렉트론 차지 팩으로 변환합니다.",
		["requirements"] = {["microfusioncell"] = 4},
		["results"] = {["electronchargepack"] = 1},
		["category"] = "탄약",
	},
	["electronchargepack_to_microfusioncell"] = {
		["name"] = "마이크로퓨전 셀 → 일렉트론 차지 팩",
		["model"] = "models/mosi/fallout4/ammo/microfusioncell.mdl",
		["desc"] = "마이크로퓨전 셀을 일렉트론 차지 팩으로 변환합니다.",
		["requirements"] = {["electronchargepack"] = 1},
		["results"] = {["microfusioncell"] = 4},
		["category"] = "탄약",
	},
	["electronchargepack_to_fusioncore"] = {
		["name"] = "일렉트론 차지 팩 → 퓨전 코어",
		["model"] = "models/mosi/fallout4/props/fusion_core.mdl",
		["desc"] = "일렉트론 차지 팩을을 퓨전 코어로 변환합니다.",
		["requirements"] = {["electronchargepack"] = 2},
		["results"] = {["fusioncore"] = 1},
		["category"] = "탄약",
	},
	["fosioncoreto_electronchargepack"] = {
		["name"] = "퓨전 코어 → 일렉트론 차지 팩",
		["model"] = "models/maxibammo/electronchargepack.mdl",
		["desc"] = "퓨전 코어를 일렉트론 차지 팩으로 변환합니다.",
		["requirements"] = {["fusioncore"] = 1},
		["results"] = {["electronchargepack"] = 2},
		["category"] = "탄약",
	},
	["servicerifle_bayonet"] = {
		["name"] = "제식 소총 (총검)",
		["model"] = "models/halokiller38/fallout/weapons/assaultrifles/battleriflebayo.mdl",
		["desc"] = "자동 사격을 할 수 있도록 제식 소총의 리시버를 교체하고, 총검을 부착합니다.",
		["requirements"] = {["servicerifle"] = 1, ["combatknife"] = 1},
		["results"] = {["servicerifle_bayonet"] = 1},
		["category"] = "개조",
	},
	["servicerifle"] = {
		["name"] = "제식 소총",
		["model"] = "models/halokiller38/fallout/weapons/assaultrifles/battleriflebayo.mdl",
		["desc"] = "제식 소총의 리시버를 단발 사격만 가능한 것으로 교체하고, 총검을 탈착합니다.",
		["requirements"] = {["servicerifle_bayonet"] = 1},
		["results"] = {["servicerifle"] = 1, ["combatknife"] = 1},
		["category"] = "개조",
	}
}

for k, v in pairs(NEW_RECIPES) do
	PLUGIN:AddRecipe(v.name, v.model, v.desc, v.requirements, v.results, k, v.skill or nil, v.blueprint or nil, v.entity or nil, v.category or "Miscellaneous")
end

--[[-------------------------------------------------------------------------
Tying in with the 'Citizen Production Plugin', adding schematics for study.
---------------------------------------------------------------------------]]
for k, v in pairs(ix.item.list) do
	if v.category == "Schematics" then
		local tbl = v.requirements
		local tbl2 = v.result
		local req_table_empty = {}
		local res_table_empty = {}
		for k2, v2 in pairs(tbl) do
			req_table_empty[v2[1]] = v2[2]
		end
		for k3,v3 in pairs(tbl2) do
			if v3[1] != "manufacturing_ticket" then
				res_table_empty[v3[1]] = v3[2]
			end
		end
		PLUGIN:AddRecipe(v.name, v.model, v.description .. "\nYou studied this blueprint from the factories.", req_table_empty, res_table_empty, v.uniqueID, false, v.uniqueID)
	end
end

ix.util.Include("cl_plugin.lua")
ix.util.Include("sv_plugin.lua")
ix.util.Include("sh_items.lua")

ix.command.Add("BlueprintGive", {
	description = "Give a blueprint to a player.",
	adminOnly = true,
	arguments = {ix.type.character, ix.type.string},
	OnRun = function(self, client, target, blueprint)
		local data = target:GetData("blueprints", {})

		if not table.HasValue(data, blueprint) then
			table.insert(data, blueprint)
		else
			client:Notify(target:GetName() .. " already has this blueprint.")

			return
		end

		target:SetData("blueprints", data)
		client:Notify("You have given " .. target:GetName() .. " the blueprint " .. blueprint .. ".")
		target.player:Notify("You have been given the blueprint " .. blueprint .. " by " .. client:Name())
	end
})

ix.command.Add("BlueprintRemove", {
	description = "Give a blueprint to a player.",
	adminOnly = true,
	arguments = {ix.type.character, ix.type.string},
	OnRun = function(self, client, target, blueprint)
		local data = target:GetData("blueprints", {})

		if table.HasValue(data, blueprint) then
			table.RemoveByValue(data, blueprint)
		else
			client:Notify(target:GetName() .. " does not have this blueprint.")
		end

		target:SetData("blueprints", data)
		client:Notify("You have taken " .. target:GetName() .. " the blueprint " .. blueprint .. ".")
		target.player:Notify("You have had the blueprint " .. blueprint .. " taken from you by " .. client:Name())
	end
})

local charMeta = ix.meta.character

function charMeta:GiveBlueprint(blueprint)
	local data = self:GetData("blueprints", {})

	if not table.HasValue(data, blueprint) then
		table.insert(data, blueprint)
	end

	self:SetData("blueprints", data)
end

function charMeta:RemoveBlueprint(blueprint)
	local data = target:GetData("blueprints", {})

	if table.HasValue(data, blueprint) then
		table.RemoveByValue(data, blueprint)
	end

	target:SetData("blueprints", data)
end