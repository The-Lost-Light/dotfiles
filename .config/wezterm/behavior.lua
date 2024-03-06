local wezterm = require "wezterm"
local module = {}

function module.config(config)
	config.audible_bell = "SystemBeep"
 
	config.switch_to_last_active_tab_when_closing_tab = true
	config.exit_behavior = "CloseOnCleanExit"

	-- config.warn_about_missing_glyphs = false
end

return module
