PLUGIN.name = "Show Bars"
PLUGIN.author = "Neon"
PLUGIN.desc = "Shows you all bars while content menu is active."
--# Configuration: true - show bar, false - don't show bar.
-- stm = stamina bar, health = health bar, hunger = hunger bar (only for cookfood plugin)
PLUGIN.wlist = {
	health = true,
	stm = true, 
	hunger = true,
	thirst = true,
	radiation = true
 }

if CLIENT then
	function PLUGIN:OnContextMenuOpen()
		local w, h = surface.ScreenWidth() * 0.35, 10
		local x, y = 4, 4
		local deltas = ix.bar.delta
		local frameTime = FrameTime()
		local curTime = CurTime()

		for k, v in ipairs(ix.bar.list) do
			if self.wlist[v.identifier] then
				local realValue = v.GetValue()
				local value = math.Approach(deltas[k] or 0, realValue, frameTime * 0.6)
				deltas[k] = value
				v.visible = true
				ix.bar.Draw(x, y, w, h, value, v.color, v)
				y = y + (h + 2)
			end
		end
		ix.bar.DrawAction()
	end
	function PLUGIN:OnContextMenuClose()
		local w, h = surface.ScreenWidth() * 0.35, 10
		local x, y = 4, 4
		local deltas = ix.bar.delta
		local frameTime = FrameTime()
		local curTime = CurTime()
		for k, v in ipairs(ix.bar.list) do
			local realValue = v.GetValue()
			local value = math.Approach(deltas[k] or 0, realValue, frameTime * 0.6)
			deltas[k] = value
			v.visible = false
		end
		ix.bar.DrawAction()
	end
end