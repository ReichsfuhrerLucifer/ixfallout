local PLUGIN = PLUGIN
PLUGIN.name = "Better Armor"
PLUGIN.author = "Subleader, Alex Grist, and Frosty"
PLUGIN.desc = "Compatible with bad air and localized damage, plus it adds damage resistance"

ix.lang.AddTable("english", {
	gasmaskRemoved = "You have removed your gasmask",
	gasmaskEquipped = "You have put on your gasmask.",
	itemBaseDescDurability = "\n \n Durability:",
	itemBaseDescBullet = "\n \nDamage Resistance: \n  Bullet: ",
	itemBaseDescSlash = "\n  Slash: ",
	itemBaseDescShock = "\n  Shock: ",
	itemBaseDescBurn = "\n  Burn: ",
	itemBaseDescRadiation = "\n  Radiation: ",
	itemBaseDescAcid = "\n  Acid: ",
	itemBaseDescExplosive = "\n  Explosive: ",
	itemCombatArmorDesc = "An armor modeled after the human silhouette, combat armors were designed to provide balanced protection without limiting user mobility.",
	itemCombatArmorDesc2 = "An armor modeled after the human silhouette, combat armors were designed to provide balanced protection without limiting user mobility.\nFemale chracters can't equip this armor.\nTo change character's skin color, contact to the server admins.",
	itemChineseStealthArmorDesc = "Hēi Guǐ (黑鬼) stealth armor (lit. Black Ghost stealth armor), was developed on the Alaskan front during the Sino-American War by Chinese army to counter the U.S. Army's power armour.",
	itemCombatArmorReinforcedDesc2 = "An armor modeled after the human silhouette, combat armors were designed to provide balanced protection without limiting user mobility.\nThis model is more protective than the previous one and has a tactical visor attached to the bulletproof helmet.\nFemale chracters can't equip this armor.\nTo change character's skin color, contact to the server admins.",
	itemMercAdventurerOutfitDesc = "Dress of mercenary explorers roaming the Mojave wilderness.\nTo change character's skin color, contact to the server admins.",
})
ix.lang.AddTable("korean", {
	gasmaskRemoved = "방독면 착용을 해제했습니다.",
	gasmaskEquipped = "방독면을 착용했습니다.",
	["Intelligence"] = "지능",
	["Armor"] = "방어구",
	itemBaseDescDurability = "\n \n 내구도:",
	itemBaseDescBullet = "\n \n피해 저항: \n  방탄: ",
	itemBaseDescSlash = "\n  방검: ",
	itemBaseDescShock = "\n  전격 저항: ",
	itemBaseDescBurn = "\n  화염 저항: ",
	itemBaseDescRadiation = "\n  방사선 피폭 저항: ",
	itemBaseDescAcid = "\n  독성 저항: ",
	itemBaseDescExplosive = "\n  충격 저항: ",
	["US Army combat armor"] = "미 육군 컴뱃 아머",
	itemCombatArmorDesc = "2051년에 처음 제작된 군용 보병 전투복으로, 복합 고분자 세라믹으로 만든 단단한 외장 플레이트와 방탄 소재가 결합된 유연한 안감으로 신체의 주요 부분을 총격으로부터 보호하도록 설계되었습니다.",
	itemCombatArmorDesc2 = "2051년에 처음 제작된 군용 보병 전투복으로, 복합 고분자 세라믹으로 만든 단단한 외장 플레이트와 방탄 소재가 결합된 유연한 안감으로 신체의 주요 부분을 총격으로부터 보호하도록 설계되었습니다.\n여성 캐릭터는 이 의상을 착용할 수 없습니다.\n백인/흑인/황인 피부 변경은 관리자에게 문의 바랍니다.",
	["Combat armor"] = "컴뱃 아머",
	["Brotherhood combat armor"] = "브라더후드 컴뱃 아머",
	["Chinese stealth armor"] = "중공군 스텔스 아머",
	itemChineseStealthArmorDesc = "흑귀 스텔스 아머는 미중 전쟁 당시 알래스카 전선에서 중공군이 미군의 파워 아머에 대항하기 위해서 개발되었습니다.",
	["Combat armor, reinforced"] = "강화 컴뱃 아머",
	itemCombatArmorReinforcedDesc2 = "2051년에 처음 제작된 군용 보병 전투복으로, 복합 고분자 세라믹으로 만든 단단한 외장 플레이트와 방탄 소재가 결합된 유연한 안감으로 신체의 주요 부분을 총격으로부터 보호하도록 설계되었습니다.\n기존 컴뱃 아머를 개량하여 보호성이 강화되고 방탄모에 전술 바이저가 부착되었습니다.\n여성 캐릭터는 이 의상을 착용할 수 없습니다.\n백인/흑인/황인 피부 변경은 관리자에게 문의 바랍니다.",
	["Desert Ranger combat armor"] = "데저트 레인저 컴뱃 아머",
	itemDesertRangerCombatArmorDesc = "데저트 레인저들이 입는 컴뱃 아머입니다.",
	["Enclave combat armor"] = "엔클레이브 컴뱃 아머",
	["Hazmat suit"] = "방사능 방호복",
	itemHazmatSuitDesc = "방사능에 오염된 주변 환경으로부터 착용자를 보호합니다.",
	["Leather armor"] = "가죽 갑옷",
	itemLeatherArmorDesc2 = "가죽을 무두질해 만든 갑옷입니다.\n여성 캐릭터는 이 의상을 착용할 수 없습니다.\n백인/흑인/황인 피부 변경은 관리자에게 문의 바랍니다.",
	["Leather armor, reinforced"] = "강화 가죽 갑옷",
	itemLeatherArmorReinforcedDesc2 = "가죽을 무두질해 만든 질긴 갑옷입니다.\n여성 캐릭터는 이 의상을 착용할 수 없습니다.\n백인/흑인/황인 피부 변경은 관리자에게 문의 바랍니다.",
	["Merc adventurer outfit"] = "용병 탐험가 복장",
	itemMercAdventurerOutfitDesc = "모하비 황무지를 돌아다니는 용병 탐험가의 복장입니다.\n여성 캐릭터는 이 의상을 착용할 수 없습니다.\n백인/흑인/황인 피부 변경은 관리자에게 문의 바랍니다.",
})

ix.util.Include("cl_plugin.lua")

function PLUGIN:EntityTakeDamage( target, dmginfo )
	if ( target:IsPlayer() ) then
		if ( target:GetNetVar("resistance") == true ) then
			if (dmginfo:IsDamageType(DMG_BULLET)) then
				dmginfo:ScaleDamage(target:GetNWFloat("dmg_bullet"))
			elseif (dmginfo:IsDamageType(DMG_SLASH)) then
				dmginfo:ScaleDamage(target:GetNWFloat("dmg_slash"))
			elseif (dmginfo:IsDamageType(DMG_SHOCK)) then
				dmginfo:ScaleDamage(target:GetNWFloat("dmg_shock"))
			elseif (dmginfo:IsDamageType(DMG_BURN)) then
				dmginfo:ScaleDamage(target:GetNWFloat("dmg_burn"))
			elseif (dmginfo:IsDamageType(DMG_RADIATION)) then
				dmginfo:ScaleDamage(target:GetNWFloat("dmg_radiation"))
			elseif (dmginfo:IsDamageType(DMG_ACID)) then
				dmginfo:ScaleDamage(target:GetNWFloat("dmg_acid"))
			elseif (dmginfo:IsExplosionDamage()) then
				dmginfo:ScaleDamage(target:GetNWFloat("dmg_explosive"))
			end
		end
	end
end

function PLUGIN:PlayerHurt( client, attacker, health, damageTaken )
	if (client:IsPlayer()) then
		local character = client:GetCharacter()
		local inventory = character:GetInventory()
		local items = inventory:GetItems()
		
		for k, v in pairs(items) do
			if (v:GetData("equip")) then
				if (v.base == "base_armor") then
					local durability = v:GetData("Durability", 100)
					
					if (durability > 0) then
						v:SetData("Durability", math.max(durability - (damageTaken/2)))
					elseif (durability == 0 or durability < 0) then
						v:RemoveOutfit(client)
						v:SetData("Durability", 0)
					end
				end
				
				if (v.base == "base_weapons") then
					local durability = v:GetData("Durability", 100)
					
					if (durability > 0) then
						v:SetData("Durability", math.max(durability - (damageTaken/6)))
					elseif (durability == 0 or durability < 0) then
						v:Unequip(client)
						v:SetData("Durability", 0)
					end
				end
			end
		end
	end
end

function PLUGIN:KeyPress(client, key)
	if (SERVER) then
		if (key == IN_ATTACK) then
			local weapon = client:GetActiveWeapon()
			
			if (weapon and weapon:Clip1() and weapon:GetNextPrimaryFire() <= CurTime()) then
				if (client:IsPlayer()) then
					local character = client:GetCharacter()
					local inventory = character:GetInventory()
					local items = inventory:GetItems()
					
					for k, v in pairs(items) do
						if (v:GetData("equip")) then
							if (v.base == "base_weapons" and v.class == weapon:GetClass()) then
								local durability = v:GetData("Durability", 100)
								
								if (durability > 0) then
									v:SetData("Durability", math.max(durability - math.random(1, 5)))
								elseif (durability == 0 or durability < 0) then
									v:Unequip(client)
									v:SetData("Durability", 0)
								end
							end
						end
					end
				end
			end
		end
	end
end

ix.command.Add("Gasmask", {
	description = "Wear or unwear your gasmask.",
	adminOnly = false,
	OnRun = function(self, client)
		local character = client:GetCharacter()
		local inventory = character:GetInventory()
		local items = inventory:GetItems()
		for k, v in pairs(items) do
			if (v.base == "base_armor") and (v.gasmask == true) then
				if client:GetNetVar("gasmask") then
					client:SetNetVar("gasmask", false)
					client:NotifyLocalized("gasmaskRemoved")
				else
					client:SetNetVar("gasmask", true)
					client:NotifyLocalized("gasmaskEquipped")
				end
			end
		end
	end
})
