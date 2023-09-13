local wezterm = require "wezterm"
local module = {}

function module.config(config)
	config.unix_domains = {
		{
			name = "unix",
		}
	}
	-- This causes "wezterm" to act as though it was started as "wezterm connect unix" by default, connecting to the unix domain on startup.
	-- If you prefer to connect manually, leave out this line.
	-- config.default_gui_startup_args = { 'connect', 'unix' }

	config.ssh_domains = {
		{
			-- This name identifies the domain
			name = "localhost",
			-- The hostname or address to connect to. Will be used to match settings
			-- from your ssh config file
			remote_address = "localhost",
			-- The username to use on the remote host
			username = "mono"
		}
	}
end

return module



