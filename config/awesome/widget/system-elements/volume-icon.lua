local wibox = require("wibox")
local awful = require('awful')
local gears = require('gears')

local clickable_container = require('widget.clickable-container.no-background')
local icons = require('theme.icons')

local mute_state = false
local current_icon = icons.symbolic.volume.medium

local volume_icon = wibox.widget{
	{
		id = "icon",
		image = current_icon,
		resize = true,
		widget = wibox.widget.imagebox
	},
	widget = clickable_container
}



awesome.connect_signal(
	'widget::volume_icon:update',
	function(value)
		if value >= 70 then
			current_icon = icons.symbolic.volume.high
		elseif value >= 30 and value < 70 then
			current_icon = icons.symbolic.volume.medium
		elseif value > 0 and value < 30 then
			current_icon = icons.symbolic.volume.low
		elseif value <= 0 then
			current_icon = icons.symbolic.volume.muted
		end
		volume_icon.icon.image = current_icon
end
)

awesome.connect_signal(
	'widget::volume_icon:mute',
	function(state)
		if state == nil then
			if mute_state then
				volume_icon.icon.image = current_icon
				mute_state = false
				else
					volume_icon.icon.image = icons.symbolic.volume.muted
				mute_state = true
				end
		elseif state == true then
			volume_icon.icon.image = icons.symbolic.volume.muted
			mute_state = true
		elseif state == false then
			volume_icon.icon.image = current_icon
			mute_state = false
		end
	end
)

return volume_icon