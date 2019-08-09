PLUGIN.name = "Disable Spray"
PLUGIN.author = "Frosty"
PLUGIN.description = "Disables player spray."

if CLIENT then
	hook.Add( "PlayerBindPress", "DisableSpray", function( ply, bind, pressed )
		if ( string.find( bind, "impulse 201" )) then return true end
	end )
end