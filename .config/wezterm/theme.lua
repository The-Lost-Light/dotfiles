local wezterm = require "wezterm"
local module = {}

function module.config(config)
	config.use_fancy_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_bar_at_bottom = true
	config.tab_max_width = 99
	-- config.enable_scroll_bar = true

	config.default_cursor_style = "BlinkingBar"
	config.cursor_blink_ease_in = "Constant"
	config.cursor_blink_ease_out = "Constant"
	config.cursor_blink_rate = 600

	config.color_scheme = "Catppuccin Macchiato"
	config.pane_focus_follows_mouse = true
	config.window_background_opacity = 0.8
	config.visual_bell = {
		target = "CursorColor"
	}
	config.use_resize_increments = true
	config.window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	}
	config.colors = {
		visual_bell = "#1e2030",
		tab_bar = {
			active_tab = {
				bg_color = "#2b2e49",
				fg_color = "#82aaff",
			},
			inactive_tab = {
				bg_color = "#1e2030",
				fg_color = "#545c7e",
			},
			new_tab = {
				bg_color = "#191b28",
				fg_color = "#82aaff",
			},
			new_tab_hover = {
				bg_color = "#82aaff",
				fg_color = "#1e2030",
			},
			inactive_tab_hover = {
				bg_color = "#1e2030",
				fg_color = "#82aaff",
			}
		}
	}
	config.font = wezterm.font_with_fallback {
		{
			family = "FiraCode Nerd Font",
			harfbuzz_features = {"cv01", "cv02", "cv03", "ss01", "cv11", "ss05", "ss03", "cv25", "cv26", "cv32", "cv28"},
		},
		"JetBrains Mono",
		"Noto Sans CJK TC",
		"Noto Sans Symbols"
	}
	config.font_size = 18
end
return module
