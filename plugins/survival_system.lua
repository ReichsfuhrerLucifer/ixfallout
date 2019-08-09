PLUGIN.name = "Survival System"
PLUGIN.author = "ZeMysticalTaco"
PLUGIN.description = "A survival system consisting of hunger and thirst."

if SERVER then
	function PLUGIN:OnCharacterCreated(client, character)
		character:SetData("hunger", 100)
		character:SetData("thirst", 100)
	end

	function PLUGIN:PlayerLoadedCharacter(client, character)
		timer.Simple(0.25, function()
			client:SetLocalVar("hunger", character:GetData("hunger", 100))
			client:SetLocalVar("thirst", character:GetData("thirst", 100))
		end)
	end

	function PLUGIN:CharacterPreSave(character)
		local client = character:GetPlayer()

		if (IsValid(client)) then
			character:SetData("hunger", client:GetLocalVar("hunger", 0))
			character:SetData("thirst", client:GetLocalVar("thirst", 0))
		end
	end
	
	function PLUGIN:PlayerDeath(client)
		client.resetHunger = true
		client.resetThirst = true
	end

	function PLUGIN:PlayerSpawn(client)
		local char = client:GetCharacter()
		
		if (client.resetHunger) then
			char:SetData("hunger", 100)
			client:SetLocalVar("hunger", 100)
			client.resetHunger = false
		end
		
		if (client.resetThirst) then
			char:SetData("thirst", 100)
			client:SetLocalVar("thirst", 100)
			client.resetThirst = false
		end
	end

	local playerMeta = FindMetaTable("Player")

	function playerMeta:SetHunger(amount)
		local char = self:GetCharacter()

		if (char) then
			char:SetData("hunger", amount)
			self:SetLocalVar("hunger", amount)
		end
	end

	function playerMeta:SetThirst(amount)
		local char = self:GetCharacter()

		if (char) then
			char:SetData("thirst", amount)
			self:SetLocalVar("thirst", amount)
		end
	end

	function playerMeta:TickThirst(amount)
		local char = self:GetCharacter()

		if (char) then
			char:SetData("thirst", char:GetData("thirst", 100) - amount)
			self:SetLocalVar("thirst", char:GetData("thirst", 100) - amount)

			if char:GetData("thirst", 100) < 0 then
				char:SetData("thirst", 0)
				self:SetLocalVar("thirst", 0)
			end
		end
	end

	function playerMeta:TickHunger(amount)
		local char = self:GetCharacter()

		if (char) then
			char:SetData("hunger", char:GetData("hunger", 100) - amount)
			self:SetLocalVar("hunger", char:GetData("hunger", 100) - amount)

			if char:GetData("hunger", 100) < 0 then
				char:SetData("hunger", 0)
				self:SetLocalVar("hunger", 0)
			end
		end
	end

	function PLUGIN:PlayerTick(ply)
		if ply:GetNetVar("hungertick", 0) <= CurTime() then
			ply:SetNetVar("hungertick", ix.config.Get("hunger_decay_speed", 300) + CurTime())
			ply:TickHunger(1, 1)
		end

		if ply:GetNetVar("thirsttick", 0) <= CurTime() then
			ply:SetNetVar("thirsttick", ix.config.Get("thirst_decay_speed", 300) + CurTime())
			ply:TickThirst(2, 1)
		end
	end
	
	local damageTime = CurTime()
	
	function PLUGIN:Think()
		if (damageTime < CurTime()) then
			for k, v in ipairs(player.GetAll()) do
				if (v:GetCharacter()) then
					if (v:GetCharacter():GetData("hunger", 0) < 40 and v:GetCharacter():GetData("hunger", 0) > 20) then
						v:TakeDamage(1,v,v:GetActiveWeapon())
					elseif (v:GetCharacter():GetData("hunger", 0) < 20) then
						v:TakeDamage(1.5,v,v:GetActiveWeapon())
					end
				
					if (v:GetCharacter():GetData("thirst", 0) < 40 and v:GetCharacter():GetData("thirst", 0) > 20) then
						v:TakeDamage(1,v,v:GetActiveWeapon())
					elseif (v:GetCharacter():GetData("thirst", 0) < 20) then
						v:TakeDamage(1.5,v,v:GetActiveWeapon())
					end
				end
			end
			
			damageTime = CurTime() + 15
		end
	end
else
	function PLUGIN:RenderScreenspaceEffects()
		if (LocalPlayer():GetCharacter()) then
			if (LocalPlayer():GetHunger() < 40) then
				DrawMotionBlur(0.1, 0.3, 0.01)
			elseif (LocalPlayer():GetHunger() < 20) then
				DrawMotionBlur(0.1, 0.7, 0.01)
			end
			
			if (LocalPlayer():GetThirst() < 40) then
				DrawMotionBlur(0.1, 0.3, 0.01)
			elseif (LocalPlayer():GetThirst() < 20) then
				DrawMotionBlur(0.1, 0.7, 0.01)
			end
		end
    end
	
	ix.bar.Add(function()
		local status = ""
		local var = LocalPlayer():GetLocalVar("hunger", 0) / 100

		if var < 0.2 then
			status = "굶주림"
		elseif var < 0.4 then
			status = "배고픔"
		elseif var < 0.6 then
			status = "출출함"
		elseif var < 0.8 then
			status = ""
		end

		return var, status
	end, Color(40, 100, 40), nil, "hunger")

	ix.bar.Add(function()
		local status = ""
		local var = LocalPlayer():GetLocalVar("thirst", 0) / 100

		if var < 0.2 then
			status = "탈수 증상"
		elseif var < 0.4 then
			status = "가벼운 탈수 증상"
		elseif var < 0.6 then
			status = "목마름"
		elseif var < 0.8 then
			status = "목이 살짝 마름"
		end

		return var, status
	end, Color(40, 40, 200), nil, "thirst")
end

local playerMeta = FindMetaTable("Player")

function playerMeta:GetHunger()
	local char = self:GetCharacter()

	if (char) then
		return char:GetData("hunger", 100)
	end
end

function playerMeta:GetThirst()
	local char = self:GetCharacter()

	if (char) then
		return char:GetData("thirst", 100)
	end
end

function PLUGIN:AdjustStaminaOffset(client, offset)
	if client:GetHunger() < 15 or client:GetThirst() < 20 then
		return -1
	end
end

ix.command.Add("CharSetHunger", {
	adminOnly = true,
	arguments = {
		ix.type.player,
		ix.type.number
	},
	OnRun = function(self, client, target, hunger)
		target:SetHunger(hunger)

		if client == target then
            client:Notify("당신의 배고픔 수치를 "..hunger.."으로 설정했습니다.")
        else
            client:Notify("당신은 "..target:GetName().."님의 배고픔 수치를 "..hunger.."으로 설정했습니다.")
            target:Notify(client:GetName().." 님이 당신의 배고픔 수치를 "..hunger.."으로 설정했습니다.")
        end
	end
})

ix.command.Add("CharSetThirst", {
	adminOnly = true,
	arguments = {
		ix.type.player,
		ix.type.number
	},
	OnRun = function(self, client, target, thirst)
		target:SetThirst(thirst)

		if client == target then
            client:Notify("당신의 목마름 수치를 "..thirst.."으로 설정했습니다.")
        else
            client:Notify("당신은 "..target:GetName().."님의 목마름 수치를 "..thirst.."으로 설정했습니다.")
            target:Notify(client:GetName().." 님이 당신의 목마름 수치를 "..thirst.."으로 설정했습니다.")
        end
	end
})