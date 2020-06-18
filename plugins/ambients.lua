
local PLUGIN = PLUGIN
PLUGIN.name = "Ambient Sounds"
PLUGIN.author = "Black Tea, Frosty"
PLUGIN.description = "Ambient Sounds"

if CLIENT then

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
			self.sndWind:ChangeVolume( .1, 4 )
		else
			if !self.sndAmbients:IsPlaying() then
				self.sndAmbients:Play()
			end
			self.sndWind:ChangeVolume( 0, 4 )
		end
	end
end
