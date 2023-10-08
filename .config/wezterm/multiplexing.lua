local wezterm = require "wezterm"
local module = {}

function module.config(config)
	config.unix_domains = {
		{
			name = "unix",
		}
	}

		config.ssh_domains = {
		{
			name = "localhost",
			remote_address = "localhost",
			username = "mono"
		}
	}
end

return module
