local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')

local dpi = require('beautiful').xresources.apply_dpi

local bar_color = beautiful.groups_bg

local quick_header = wibox.widget
{

	text = 'Quick Settings',
	font = 'SF Pro Text Regular 12',
	align = 'left',
	valign = 'center',
	widget = wibox.widget.textbox

}

return wibox.widget {
	layout = wibox.layout.fixed.vertical,
	spacing = dpi(7),
	{
		layout = wibox.layout.fixed.vertical,
		{
			{
				quick_header,
				left = dpi(24),
				right = dpi(24),
				widget = wibox.container.margin
			},
			forced_height = dpi(35),
			bg = beautiful.groups_title_bg,
			shape = function(cr, width, height)
				gears.shape.partially_rounded_rect(cr, width, height, true, true, false, false, beautiful.groups_radius) 
			end,
			widget = wibox.container.background
			
		},

		{
			require('widget.sliders.brightness-slider'),
			bg = bar_color,
			shape = function(cr, width, height)
				gears.shape.partially_rounded_rect(cr, width, height, false, false, false, false, beautiful.groups_radius) end,
			forced_height = dpi(48),
			widget = wibox.container.background

		},
		{
			require('widget.sliders.volume-slider'),
			bg = bar_color,
			shape = function(cr, width, height)
				gears.shape.partially_rounded_rect(cr, width, height, false, false, false, false, beautiful.groups_radius) end,
			forced_height = dpi(48),
			widget = wibox.container.background

		},

		{
			require('widget.togglers.network-toggle'),
			bg = bar_color,
			shape = function(cr, width, height)
				gears.shape.partially_rounded_rect(cr, width, height, false, false, false, false, beautiful.groups_radius) end,
			forced_height = dpi(48),
			widget = wibox.container.background
		},

		-- {
		-- 	require('widget.togglers.bluetooth-toggle'),
		-- 	bg = bar_color,
		-- 	shape = function(cr, width, height)
		-- 		 gears.shape.partially_rounded_rect(cr, width, height, false, false, false, false, beautiful.groups_radius) end,
		-- 	forced_height = dpi(48),
		-- 	widget = wibox.container.background
		-- },
		{
			require('widget.togglers.blue-light'),
			bg = bar_color,
			shape = function(cr, width, height)
				gears.shape.partially_rounded_rect(cr, width, height, false, false, false, false, beautiful.groups_radius) end,
			forced_height = dpi(48),
			widget = wibox.container.background
		},
		{
			require('widget.togglers.compositor'),
			bg = bar_color,
			shape = function(cr, width, height)
				 gears.shape.partially_rounded_rect(cr, width, height, false, false, true, true, beautiful.groups_radius) end,
			forced_height = dpi(48),
			widget = wibox.container.background
		}
	}
}