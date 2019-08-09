--[[
This work is licensed under a Creative Commons
Attribution-ShareAlike 4.0 International License.
Created by 8bitMafia.
--]]

PLUGIN.name = "Playsound"
PLUGIN.author = "8bitMafia, D3ADL0RD, Frosty"
PLUGIN.desc = "Allow admins to easily play music."

if (SERVER) then
	util.AddNetworkString("ixRequestSound")
	util.AddNetworkString("ixBroadcastSound")
	util.AddNetworkString("ixOpenSoundMenu")

	net.Receive("ixRequestSound", function(len, client)
		local path = net.ReadString()
		if (client:IsAdmin()) then
			net.Start("ixBroadcastSound")
			net.WriteString(path)
			net.Broadcast()
		end
	end)
end

ix.command.Add("PlaySound", {
	adminOnly = true,
	OnRun = function(self, client)
		net.Start("ixOpenSoundMenu")
		net.Send(client)
	end
})

local function PlaySound(path)
	surface.PlaySound("garrysmod/ui_click.wav")
	net.Start("ixRequestSound")
	net.WriteString(path)
	net.SendToServer()
end

net.Receive("ixOpenSoundMenu", function()
	local Menu = vgui.Create("DMenu")
	Menu:MakePopup()
	Menu:Center()
	Menu:AddOption("Intro", function() PlaySound("music/HL2_intro.mp3") end)
	Menu:AddOption("Song0", function() PlaySound("music/HL2_song0.mp3") end)
	Menu:AddOption("Song1", function() PlaySound("music/HL2_song1.mp3") end)
	Menu:AddOption("Song2", function() PlaySound("music/HL2_song2.mp3") end)
	Menu:AddOption("Song3", function() PlaySound("music/HL2_song3.mp3") end)
	Menu:AddOption("Song4", function() PlaySound("music/HL2_song4.mp3") end)
	Menu:AddOption("Song6", function() PlaySound("music/HL2_song6.mp3") end)
	Menu:AddOption("Song7", function() PlaySound("music/HL2_song7.mp3") end)
	Menu:AddOption("Song8", function() PlaySound("music/HL2_song8.mp3") end)
	Menu:AddOption("Song10", function() PlaySound("music/HL2_song10.mp3") end)
	Menu:AddOption("Song11", function() PlaySound("music/HL2_song11.mp3") end)
	Menu:AddOption("Song12 Long", function() PlaySound("music/HL2_song12_long.mp3") end)
	Menu:AddOption("Song13", function() PlaySound("music/HL2_song13.mp3") end)
	Menu:AddOption("Song14", function() PlaySound("music/HL2_song14.mp3") end)
	Menu:AddOption("Song15", function() PlaySound("music/HL2_song15.mp3") end)
	Menu:AddOption("Song16", function() PlaySound("music/HL2_song16.mp3") end)
	Menu:AddOption("Song17", function() PlaySound("music/HL2_song17.mp3") end)
	Menu:AddOption("Song19", function() PlaySound("music/HL2_song19.mp3") end)
	local SubMenu1 = Menu:AddSubMenu("Submix")
	SubMenu1:AddOption("Song20 Submix0", function() PlaySound("music/HL2_song20_submix0.mp3") end)
	SubMenu1:AddOption("Song20 Submix4 ", function() PlaySound("music/HL2_song20_submix4.mp3") end)
	Menu:AddOption("Song23 SuitSong3", function() PlaySound("music/HL2_song23_SuitSong3.mp3") end)
	Menu:AddOption("Song25 Teleporter", function() PlaySound("music/HL2_song25_Teleporter.mp3") end)
	Menu:AddOption("Song26", function() PlaySound("music/HL2_song26.mp3") end)
	local SubMenu2 = Menu:AddSubMenu("Trainstation")
	SubMenu2:AddOption("Song26 Trainstation1", function() PlaySound("music/HL2_song26_trainstation1.mp3") end)
	SubMenu2:AddOption("Song27 Trainstation2 ", function() PlaySound("music/HL2_song27_trainstation2.mp3") end)
	Menu:AddOption("Song28", function() PlaySound("music/HL2_song28.mp33") end)
	Menu:AddOption("Song29", function() PlaySound("music/HL2_song29.mp3") end)
	Menu:AddOption("Song30", function() PlaySound("music/HL2_song30.mp3") end)
	Menu:AddOption("Song31", function() PlaySound("music/HL2_song31.mp3") end)
	Menu:AddOption("Song32", function() PlaySound("music/HL2_song32.mp3") end)
	Menu:AddOption("Song33", function() PlaySound("music/HL2_song33.mp3") end)
end)

net.Receive("ixBroadcastSound", function()
	local path = net.ReadString()

	surface.PlaySound(path)
end)