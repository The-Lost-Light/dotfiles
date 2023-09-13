-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if require("wezterm").config_builder then
  config = require("wezterm").config_builder()
end

-- Set up config
require("theme").config(config)
require("behavior").config(config)
require("multiplexing").config(config)

-- and finally, return the configuration to wezterm
return config
