PLUGIN.name = "NPC Money Kill"
PLUGIN.author = "Stan, Frosty"
PLUGIN.description = "Allows the player to earn money from killing NPCs"

ix.config.Add("NPCKillAmount", 10, "How much money a player gets for killing an NPC", nil, {
	data = {min = 0, max = 1000},
	category = "NPC"
})

ix.lang.AddTable("english", {
    NPCMoneyKill = "You have recived %s for killing an NPC.",
})
ix.lang.AddTable("korean", {
    NPCMoneyKill = "NPC 처치 보상으로 %s을(를) 받았습니다.",
})

function PLUGIN:OnNPCKilled(victim, ent, weapon)
    -- If something killed the npc
    if not ent then return end

    if ent:IsVehicle() and ent:GetDriver():IsPlayer() then ent = ent:GetDriver() end

    local money = math.random(0, ix.config.Get("NPCKillAmount"))

    if  IsValid(ent) and ent:IsPlayer() and ent:GetCharacter() and ent:GetCharacter():GetAttribute("lck", 0) then
        money = money + ix.config.Get("luckMultiplier") * ent:GetCharacter():GetAttribute("lck", 0)
    end

    -- If we know by now who killed the NPC, pay them.
    if IsValid(ent) and ent:IsPlayer() and ix.config.Get("NPCKillAmount") > 0 and money > 0 then
        local char = ent:GetCharacter()
        char:GiveMoney(money)
        char.player:NotifyLocalized("NPCMoneyKill", ix.currency.Get(money))
    end
end