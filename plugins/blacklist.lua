PLUGIN.name = "Blacklist"
PLUGIN.author = "Dobytchick, Frosty"
PLUGIN.description = "This plugin dds a blacklist. Do not remove those who are in it, because they can harm your servers"

local blacklist =
{
-- ["STEAM_0:0:000000000"] = {reason =     ""},
}
if SERVER then
	function PLUGIN:PlayerAuthed(client, steamid, uniqueid)
		if blacklist[client:SteamID()] then
			client:Kick("당신은 이 서버의 블랙리스트에 포함되어 있습니다, 사유:" ..blacklist[client:SteamID()].reason)
			lient:Ban(0, false)
		end
	end
end