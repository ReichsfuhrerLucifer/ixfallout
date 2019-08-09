PLUGIN.name = "Miscellaneous"
PLUGIN.author = "ZeMysticalTaco, Frosty"
PLUGIN.description = "Cool things."
PLUGIN.SaveEnts = PLUGIN.SaveEnts or {}
--skinny bars are disgusting
BAR_HEIGHT = 12

--[[-------------------------------------------------------------------------
	move settings to tab
---------------------------------------------------------------------------]]
if CLIENT then
	hook.Add("CreateMenuButtons", "ixSettings", function(tabs)
		tabs["settings"] = {
			Create = function(info, container)
				container:SetTitle(L("settings"))

				local panel = container:Add("ixSettings")
				panel:SetSearchEnabled(true)

				for category, options in SortedPairs(ix.option.GetAllByCategories(true)) do
					category = L(category)
					panel:AddCategory(category)

					-- sort options by language phrase rather than the key
					table.sort(options, function(a, b)
						return L(a.phrase) < L(b.phrase)
					end)

					for _, data in pairs(options) do
						local key = data.key
						local row = panel:AddRow(data.type, category)
						local value = ix.util.SanitizeType(data.type, ix.option.Get(key))

						row:SetText(L(data.phrase))
						row:Populate(key, data)

						-- type-specific properties
						if (data.type == ix.type.number) then
							row:SetMin(data.min or 0)
							row:SetMax(data.max or 10)
							row:SetDecimals(data.decimals or 0)
						end

						row:SetValue(value, true)
						row:SetShowReset(value != data.default, key, data.default)
						row.OnValueChanged = function()
							local newValue = row:GetValue()

							row:SetShowReset(newValue != data.default, key, data.default)
							ix.option.Set(key, newValue)
						end

						row.OnResetClicked = function()
							row:SetShowReset(false)
							row:SetValue(data.default, true)

							ix.option.Set(key, data.default)
						end

						row:GetLabel():SetHelixTooltip(function(tooltip)
							local title = tooltip:AddRow("name")
							title:SetImportant()
							title:SetText(key)
							title:SizeToContents()
							title:SetMaxWidth(math.max(title:GetMaxWidth(), ScrW() * 0.5))

							local description = tooltip:AddRow("description")
							description:SetText(L(data.description))
							description:SizeToContents()
						end)
					end
				end

				panel:SizeToContents()
				container.panel = panel
			end,

			OnSelected = function(info, container)
				container.panel.searchEntry:RequestFocus()
			end
		}
	end)
end

function PLUGIN:PlayerHurt(client, attacker, health, damage)
	if attacker:IsPlayer() then
		ix.log.AddRaw(client:Name() .. " has taken " .. damage .. " damage from " .. attacker:Name() .. " using " .. attacker:GetActiveWeapon():GetClass() .. " leaving them at " .. health .. " HP!", nil, Color(255, 200, 0))
	else
		ix.log.AddRaw(client:Name() .. " has taken " .. math.floor(damage) .. " damage from " .. attacker:GetClass() .. " leaving them at " .. math.floor(health) .. " HP!", nil, Color(255, 200, 0))
	end
end

--[[-------------------------------------------------------------------------
	BETTER ADMIN ESP
---------------------------------------------------------------------------]]
local dimDistance = -1
local aimLength = 128

ix.lang.AddTable("english", {
	optItemESP = "Show item ESP",
	optdItemESP = "Shows the names and locations of each item in the server.",
})
ix.lang.AddTable("korean", {
	optItemESP = "아이템 ESP 켜기",
	optdItemESP = "서버에 있는 각각의 아이템의 이름과 위치를 표시합니다.",
})

ix.option.Add("itemESP", ix.type.bool, true, {
	category = "observer",
	hidden = function()
		return !CAMI.PlayerHasAccess(LocalPlayer(), "Helix - Observer", nil)
	end
})

	function PLUGIN:HUDPaint()
		local client = LocalPlayer()

		if (client:IsAdmin() and client:GetMoveType() == MOVETYPE_NOCLIP and not client:InVehicle() and ix.option.Get("observerESP", true)) then
			local scrW, scrH = ScrW(), ScrH()

			if ix.option.Get("itemESP") then
				for k, v in pairs(ents.GetAll()) do
					if v:GetClass() == "ix_item" then
						local espcol = Color(255,255,255,255)
						local screenPosition = v:GetPos():ToScreen()
						local marginX, marginY = scrH * .1, scrH * .1
						local x2, y2 = math.Clamp(screenPosition.x, marginX, scrW - marginX), math.Clamp(screenPosition.y, marginY, scrH - marginY)
						local distance = client:GetPos():Distance(v:GetPos())
						local factor = 1 - math.Clamp(distance / dimDistance, 0, 1)
						local size2 = math.max(10, 32 * factor)
						local alpha2 = math.max(255 * factor, 80)
						local itemTable = v:GetItemTable()
						local espcols = {
							["Weapons"] = Color(255,50,50),
							["Ammunition"] = Color(155,50,50),
							["Food"] = Color(100,255,100),
							["Crafting"] = Color(150,200,50),
							["Clothes"] = Color(65,200,150),
							["Attachments"] = Color(50,255,175),
							["Survival"] = Color(50,255,175)
						}

						for k2, v2 in pairs(espcols) do
							if itemTable.category == k2 then
								espcol = v2
							end
						end
						ix.util.DrawText(itemTable.name, x2, y2 - size2, espcol, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha2)
						--ix.util.DrawText(itemTable.category, x2, y2 - size2 + 15, espcol, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha2)
					end
				end
			end

			for _, v in ipairs(player.GetAll()) do
				if (v == client or not v:GetCharacter()) then continue end
				local screenPosition = v:GetPos():ToScreen()
				local marginX, marginY = scrH * .1, scrH * .1
				local x, y = math.Clamp(screenPosition.x, marginX, scrW - marginX), math.Clamp(screenPosition.y, marginY, scrH - marginY)
				local teamColor = team.GetColor(v:Team())
				local distance = client:GetPos():Distance(v:GetPos())
				local factor = 1 - math.Clamp(distance / dimDistance, 0, 1)
				local size = math.max(10, 32 * factor)
				local alpha = math.max(255 * factor, 80)
				surface.SetDrawColor(teamColor.r, teamColor.g, teamColor.b, alpha)
				surface.SetFont("ixGenericFont")
				local text = v:Name()
				
				if not v.status then
					v.status = "user"
				elseif v:IsUserGroup("superadmin") then
					v.status = "SA"
				elseif v:IsUserGroup("admin") then
					v.status = "A"
				elseif v:IsUserGroup("operator") then
					v.status = "O"
				elseif v:IsUserGroup("user") then
					v.status = "user"
				elseif v:IsUserGroup("producer") then
					v.status = "producer"
				else
					v.status = v:GetUserGroup()
				end

				local text2 = v:SteamName() .. "[" .. v.status .. "]"
				local text3 = "H: " .. v:Health() .. " A: " .. v:Armor()
				local text4 = v:GetActiveWeapon().PrintName
				surface.SetDrawColor(teamColor.r * 1.6, teamColor.g * 1.6, teamColor.b * 1.6, alpha)
				local col = Color(255, 255, 255, 255)

				if v:IsWepRaised() then
					col = Color(255, 100, 100, 255)
				end

				ix.util.DrawText(text, x, y - size, ColorAlpha(teamColor, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
				ix.util.DrawText(text2, x, y - size + 20, Color(200, 200, 200, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
				ix.util.DrawText(text3, x, y - size + 40, Color(200, 200, 200, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
				ix.util.DrawText(text4, x, y - size + 60, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
			end
		end
	end

local playerMeta = FindMetaTable("Player")

--[[-------------------------------------------------------------------------
	playerMeta:GetItemWeapon()

	Purpose: Checks the player's currently equipped weapon and returns the item and weapon.
	Syntax: player:GetItemWeapon()
	Returns: @weapon, @item
---------------------------------------------------------------------------]]

function playerMeta:GetItemWeapon()
	local char = self:GetCharacter()
	local inv = char:GetInventory()
	local items = inv:GetItems()
	local weapon = self:GetActiveWeapon()

	for k, v in pairs(items) do
		if v.class then
			if v.class == weapon:GetClass() then
				if v:GetData("equip", false) then
					return weapon, v
				else
					return false
				end
			end
		end
	end
end

--[[-------------------------------------------------------------------------
	Legs?
---------------------------------------------------------------------------]]

g_LegsLog =
[[
	[FIX] problem with leg refresh
	[FIX] problem were thirdperson view in vehicles
]]

g_LegsVer = "3.8.9a"

local PLAYER 			= FindMetaTable("Player")
local ENTITY 			= FindMetaTable("Entity")

local bHasShownNotice = false
do
	ENTITY._SetModel = ENTITY._SetModel or ENTITY.SetModel

	function PLAYER:SetModel( model )
		self:_SetModel(model)
        hook.Run("SetModel", self, model)
	end

	function PLAYER:SetLegsModel( model )
        if (SERVER) then
		    self:SetNWString( "PlayerMeta.PlayerModel", model )
			self:ConCommand("cl_refreshlegs")
	    end
	end

	function PLAYER:GetLegModel()
		local model = self:GetNWString( "PlayerMeta.PlayerModel", false )
		if (!model) then
			model = self:GetModel()
		end
		return model
	end

	hook.Add("SetModel", "GML::SetModel::Hook", function(ply, mdl)
		if (SERVER) then
			ply:SetLegsModel(mdl)
		end
	end)
end

ix.lang.AddTable("english", {
	optLegsEnabled = "Show legs",
	optdLegsEnabled = "Enable the rendering of the legs.",
	optVehlegsEnabled = "Show legs in vehicle",
	optdVehlegsEnabled = "Enable/Disable the rendering of the legs in vehicles.",
})
ix.lang.AddTable("korean", {
	optLegsEnabled = "다리 보기",
	optdLegsEnabled = "자신의 캐릭터 다리를 내려다볼 수 있도록 합니다.",
	optVehlegsEnabled = "차 안에서 다리 보기",
	optdVehlegsEnabled = "차 안에서 자신의 캐릭터 다리를 내려다볼 수 있도록 합니다.",
})

if (CLIENT) then
	ix.option.Add("legsEnabled", ix.type.bool, true, {
		category = "appearance"
	})
	ix.option.Add("vehlegsEnabled", ix.type.bool, true, {
		category = "appearance"
	})
	
	-- local LegsBool      	= CreateConVar("cl_legs", "1", {FCVAR_ARCHIVE}, "Enable/Disable the rendering of the legs")
	-- local VLegsBool     	= CreateConVar("cl_vehlegs", "1", {FCVAR_ARCHIVE}, "Enable/Disable the rendering of the legs in vehicles")

    local Legs = {}
    Legs.LegEnt = nil

	local g_maxseqgroundspeed = 0
	local g_velocity = 0

    function Legs:CheckDrawVehicle()
        if (LocalPlayer():InVehicle()) then
			if (ix.option.Get("legsEnabled", true)) && (!ix.option.Get("vehlegsEnabled")) then
				return true
			end
			return false
        end
    end

    function ShouldDrawLegs()
        if (hook.Run("ShouldDisableLegs") == true) then 
            return false 
        end
        if (ix.option.Get("legsEnabled", true)) then
            return  IsValid(Legs.LegEnt)                                                                      &&
                    (LocalPlayer():Alive() || (LocalPlayer().IsGhosted && LocalPlayer():IsGhosted()))       &&
                    !Legs:CheckDrawVehicle()                                                                    &&
                    GetViewEntity() == LocalPlayer()                                                            &&
                    !LocalPlayer():ShouldDrawLocalPlayer()                                                      &&
                    !IsValid(LocalPlayer():GetObserverTarget())                                                 &&
                    !LocalPlayer().ShouldDisableLegs
        else
            return false
        end
    end

    function GetPlayerLegs(ply)
        return ply && ply != LocalPlayer() && ply || (ShouldDrawLegs() && Legs.LegEnt || LocalPlayer())
    end

    function Legs:SetUp()

		if (!IsValid(self.LegEnt)) then
			self.LegEnt = ClientsideModel(LocalPlayer():GetLegModel(), RENDER_GROUP_OPAQUE_ENTITY)	
		else
			self.LegEnt:SetModel(LocalPlayer():GetLegModel())
		end

        self.LegEnt:SetNoDraw(true)

		for k, v in pairs(LocalPlayer():GetBodyGroups()) do
			local current = LocalPlayer():GetBodygroup(v.id)
			self.LegEnt:SetBodygroup(v.id,  current)
		end

		for k, v in ipairs(LocalPlayer():GetMaterials()) do
			self.LegEnt:SetSubMaterial(k - 1, LocalPlayer():GetSubMaterial(k - 1))
		end

        self.LegEnt:SetSkin(LocalPlayer():GetSkin())
        self.LegEnt:SetMaterial(LocalPlayer():GetMaterial())
        self.LegEnt:SetColor(LocalPlayer():GetColor())
        self.LegEnt.GetPlayerColor = function()
            return LocalPlayer():GetPlayerColor()
        end

		self.LegEnt.Anim = nil
	   	self.PlaybackRate = 1
		self.Sequence = nil
		self.Velocity = 0
		self.OldWeapon = nil
		self.HoldType = nil

		self.BonesToRemove = {}

		self.BoneMatrix = nil

        self.LegEnt.LastTick = 0

		self:Update(g_maxseqgroundspeed)
    end

    Legs.PlaybackRate = 1
    Legs.Sequence = nil
    Legs.Velocity = 0
    Legs.OldWeapon = nil
    Legs.HoldType = nil

    Legs.BonesToRemove = {}

    Legs.BoneMatrix = nil

    function Legs:WeaponChanged(weap)
        if IsValid(self.LegEnt) then
            for i = 0, self.LegEnt:GetBoneCount() do
                self.LegEnt:ManipulateBoneScale(i, Vector(1,1,1))
                self.LegEnt:ManipulateBonePosition(i, vector_origin)
            end

            self.BonesToRemove =
            {
                "ValveBiped.Bip01_Head1",
                "ValveBiped.Bip01_L_Hand",
                "ValveBiped.Bip01_L_Forearm",
                "ValveBiped.Bip01_L_Upperarm",
                "ValveBiped.Bip01_L_Clavicle",
                "ValveBiped.Bip01_R_Hand",
                "ValveBiped.Bip01_R_Forearm",
                "ValveBiped.Bip01_R_Upperarm",
                "ValveBiped.Bip01_R_Clavicle",
                "ValveBiped.Bip01_L_Finger4",
                "ValveBiped.Bip01_L_Finger41",
                "ValveBiped.Bip01_L_Finger42",
                "ValveBiped.Bip01_L_Finger3",
                "ValveBiped.Bip01_L_Finger31",
                "ValveBiped.Bip01_L_Finger32",
                "ValveBiped.Bip01_L_Finger2",
                "ValveBiped.Bip01_L_Finger21",
                "ValveBiped.Bip01_L_Finger22",
                "ValveBiped.Bip01_L_Finger1",
                "ValveBiped.Bip01_L_Finger11",
                "ValveBiped.Bip01_L_Finger12",
                "ValveBiped.Bip01_L_Finger0",
                "ValveBiped.Bip01_L_Finger01",
                "ValveBiped.Bip01_L_Finger02",
                "ValveBiped.Bip01_R_Finger4",
                "ValveBiped.Bip01_R_Finger41",
                "ValveBiped.Bip01_R_Finger42",
                "ValveBiped.Bip01_R_Finger3",
                "ValveBiped.Bip01_R_Finger31",
                "ValveBiped.Bip01_R_Finger32",
                "ValveBiped.Bip01_R_Finger2",
                "ValveBiped.Bip01_R_Finger21",
                "ValveBiped.Bip01_R_Finger22",
                "ValveBiped.Bip01_R_Finger1",
                "ValveBiped.Bip01_R_Finger11",
                "ValveBiped.Bip01_R_Finger12",
                "ValveBiped.Bip01_R_Finger0",
                "ValveBiped.Bip01_R_Finger01",
                "ValveBiped.Bip01_R_Finger02",
                "ValveBiped.Bip01_Spine4",
                "ValveBiped.Bip01_Spine2",
            }

			if ( LocalPlayer():InVehicle() ) then
				self.BonesToRemove =
          	  	{
               		"ValveBiped.Bip01_Head1",
				}
			end

            for k, v in pairs(self.BonesToRemove) do
                local bone = self.LegEnt:LookupBone(v)
                if (bone) then
                    self.LegEnt:ManipulateBoneScale(bone, Vector(0,0,0))
                   	if ( !LocalPlayer():InVehicle() ) then
						self.LegEnt:ManipulateBonePosition(bone, Vector(0,-100,0))
						self.LegEnt:ManipulateBoneAngles(bone, Angle(0,0,0))
					end
                end
            end
        end
    end

    Legs.BreathScale = 0.5
    Legs.NextBreath = 0

    function Legs:Think(maxseqgroundspeed)
        if not LocalPlayer():Alive() then
            Legs:SetUp()
            return
        end

		self:Update(maxseqgroundspeed)
    end

	function Legs:Update(maxseqgroundspeed)
        if IsValid(self.LegEnt) then
            self:WeaponChanged(LocalPlayer():GetActiveWeapon())

            self.Velocity = LocalPlayer():GetVelocity():Length2D()

            self.PlaybackRate = 1

            if self.Velocity > 0.5 then
                if maxseqgroundspeed < 0.001 then
                    self.PlaybackRate = 0.01
                else
                    self.PlaybackRate = self.Velocity / maxseqgroundspeed
                    self.PlaybackRate = math.Clamp(self.PlaybackRate, 0.01, 10)
                end
            end

            self.LegEnt:SetPlaybackRate(self.PlaybackRate)

            self.Sequence = LocalPlayer():GetSequence()

            if (self.LegEnt.Anim != self.Sequence) then
                self.LegEnt.Anim = self.Sequence
                self.LegEnt:ResetSequence(self.Sequence)
            end

            self.LegEnt:FrameAdvance(CurTime() - self.LegEnt.LastTick)
            self.LegEnt.LastTick = CurTime()

            Legs.BreathScale = sharpeye && sharpeye.GetStamina && math.Clamp(math.floor(sharpeye.GetStamina() * 5 * 10) / 10, 0.5, 5) || 0.5

            if Legs.NextBreath <= CurTime() then
                Legs.NextBreath = CurTime() + 1.95 / Legs.BreathScale
                self.LegEnt:SetPoseParameter("breathing", Legs.BreathScale)
            end

            self.LegEnt:SetPoseParameter("move_x", (LocalPlayer():GetPoseParameter("move_x") * 2) - 1) -- Translate the walk x direction
            self.LegEnt:SetPoseParameter("move_y", (LocalPlayer():GetPoseParameter("move_y") * 2) - 1) -- Translate the walk y direction
            self.LegEnt:SetPoseParameter("move_yaw", (LocalPlayer():GetPoseParameter("move_yaw") * 360) - 180) -- Translate the walk direction
            self.LegEnt:SetPoseParameter("body_yaw", (LocalPlayer():GetPoseParameter("body_yaw") * 180) - 90) -- Translate the body yaw
            self.LegEnt:SetPoseParameter("spine_yaw",(LocalPlayer():GetPoseParameter("spine_yaw") * 180) - 90) -- Translate the spine yaw

            if LocalPlayer():InVehicle() then
                self.LegEnt:SetPoseParameter("vehicle_steer", (LocalPlayer():GetVehicle():GetPoseParameter("vehicle_steer") * 2) - 1) -- Translate the vehicle steering
            end
        end
	end

    hook.Add("UpdateAnimation", "GML:UpdateAnimation", function(ply, velocity, maxseqgroundspeed)
        if ply == LocalPlayer() then
            if IsValid(Legs.LegEnt) then
                Legs:Think(maxseqgroundspeed)
				if (string.lower(LocalPlayer():GetLegModel()) != string.lower(Legs.LegEnt:GetModel())) then
                    Legs:SetUp()
				end
            else
				Legs:SetUp()
			end
        end
    end)

    Legs.RenderAngle = nil
    Legs.BiaisAngle = nil
    Legs.RadAngle = nil
    Legs.RenderPos = nil
    Legs.RenderColor = {}
    Legs.ClipVector = vector_up * -1
    Legs.ForwardOffset = -24

	function Legs:DoFinalRender()
	   cam.Start3D(EyePos(), EyeAngles())
            if ShouldDrawLegs() then

                if (LocalPlayer():Crouching() || LocalPlayer():InVehicle()) then
                    self.RenderPos = LocalPlayer():GetPos()
                else
                    self.RenderPos = LocalPlayer():GetPos() + Vector(0,0,5)
                end

                if LocalPlayer():InVehicle() then
                    self.RenderAngle = LocalPlayer():GetVehicle():GetAngles()
                    self.RenderAngle:RotateAroundAxis(self.RenderAngle:Up(), 90)
                else
                    self.BiaisAngles = sharpeye_focus && sharpeye_focus.GetBiaisViewAngles && sharpeye_focus:GetBiaisViewAngles() || LocalPlayer():EyeAngles()
                    self.RenderAngle = Angle(0, self.BiaisAngles.y, 0)
                    self.RadAngle = math.rad(self.BiaisAngles.y)
                    self.ForwardOffset = -22
                    self.RenderPos.x = self.RenderPos.x + math.cos(self.RadAngle) * self.ForwardOffset
                    self.RenderPos.y = self.RenderPos.y + math.sin(self.RadAngle) * self.ForwardOffset

                    if LocalPlayer():GetGroundEntity() == NULL then
                        self.RenderPos.z = self.RenderPos.z + 8
                        if LocalPlayer():KeyDown(IN_DUCK) then
                            self.RenderPos.z = self.RenderPos.z - 28
                        end
                    end
                end

                self.RenderColor = LocalPlayer():GetColor()

                local bEnabled = render.EnableClipping(true)
                    render.PushCustomClipPlane(self.ClipVector, self.ClipVector:Dot(EyePos()))
                        render.SetColorModulation(self.RenderColor.r / 255, self.RenderColor.g / 255, self.RenderColor.b / 255)
                            render.SetBlend(self.RenderColor.a / 255)
                                    self.LegEnt:SetRenderOrigin(self.RenderPos)
                                    self.LegEnt:SetRenderAngles(self.RenderAngle)
                                    self.LegEnt:SetupBones()
                                    self.LegEnt:DrawModel()
									self.LegEnt:SetRenderOrigin()
                                    self.LegEnt:SetRenderAngles()
                            render.SetBlend(1)
                        render.SetColorModulation(1, 1, 1)
                    render.PopCustomClipPlane()
                render.EnableClipping(bEnabled)
            end
        cam.End3D()
	end

	hook.Add("PostDrawTranslucentRenderables", "GML:Render::Foot", function()
		 if (LocalPlayer() && !LocalPlayer():InVehicle()) then
			Legs:DoFinalRender()
        end
    end)

	hook.Add("RenderScreenspaceEffects", "GML:Render::Vehicle", function()
		 if (LocalPlayer():InVehicle()) then
			Legs:DoFinalRender()
        end
    end)

    hook.Add("CalcView", "GML::CalcView::ViewCorrection::Vehicle", function( player, origin, angles, fov )
		if (!player:InVehicle()) then
			return
		end 

		if (!ix.option.Get("vehlegsEnabled", true)) then
			return
		end

		
		local view = {}
		view.origin		= origin
		view.angles		= angles
		view.fov		= fov
		view.znear		= znear
		view.zfar		= zfar
		view.drawviewer	= false

		local Vehicle	= player:GetVehicle()

		if ( IsValid( Vehicle ) && Vehicle:GetThirdPersonMode() ) then 
			return hook.Run( "CalcVehicleView", Vehicle, player, view ) 
		end

		local headBone = player:LookupBone("ValveBiped.Bip01_Head1")
		if (!headBone) then 
			return 
		end

		local pos, ang  = player:GetBonePosition(headBone)
		if (!pos) then 
			return 
		end

		local baseView = {
			origin = Vector(pos.x, pos.y, pos.z + 5),
			fov = 90,
			znear = 1
		}

		return baseView
    end)

	concommand.Add("cl_refreshlegs", function()
		Legs:SetUp()
    end)

    g_Legs = Legs

    function SetupLegs()
        g_Legs:SetUp()
    end

    hook.Add("ShouldDisableLegs", "GML::Support::Prone", function()
        if (!PLAYER.IsProne) then
            return
        end

        if (LocalPlayer():IsProne()) then
            return true
        end
    end)

    hook.Add("ShouldDisableLegs", "GML::Support::MorphMod", function()
        if (!pk_pills) then
            return
        end

        if (pk_pills.getMappedEnt(LocalPlayer())) then
            return true
        end
    end)
end