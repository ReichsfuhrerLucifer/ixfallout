
local PLUGIN = PLUGIN
PLUGIN.name = "Ambient Sounds"
PLUGIN.author = "Black Tea, Frosty"
PLUGIN.description = "Ambient Sounds"

ix.lang.AddTable("english", {
	ambient = "Ambient Sounds",
	optWindVolume = "Set Wind Volume",
	optdWindVolume = "Set amount volume of the ambient winds.",
})

ix.lang.AddTable("korean", {
	ambient = "환경음",
	optWindVolume = "바람 소리 세기",
	optdWindVolume = "바람 환경음의 소리 세기를 조절합니다.",
})

if CLIENT then
	ix.option.Add("windVolume", ix.type.number, 0.1, {
		category = "ambient", min = 0, max = 1, decimals = 2
	})

	PLUGIN.timeData = {}
	PLUGIN.sndWind = nil
	PLUGIN.sndAmbients = nil
	
	function PLUGIN:Think()
		PLUGIN.sndWind = PLUGIN.sndWind or CreateSound( LocalPlayer(), "vehicles/fast_windloop1.wav" )
		PLUGIN.sndAmbients = PLUGIN.sndAmbients or CreateSound( LocalPlayer(), Format( "nv_ambiant/nv_%d.mp3", math.random( 1, 13 ) ) )
		
		local data = {}
			data.start = LocalPlayer():GetShootPos()
			data.endpos = data.start + Vector( 0, 0, 10000 )
			data.filter = LocalPlayer()
		local trace = util.TraceLine(data)

		if trace.HitSky then
			if !self.sndWind:IsPlaying() then
				self.sndWind:Play()
			end
			self.sndWind:ChangeVolume( ix.option.Get("windVolume", 0.1), 4 )
		else
			if !self.sndAmbients:IsPlaying() then
				self.sndAmbients:Play()
			end
			self.sndWind:ChangeVolume( 0, 4 )
		end
	end
end
