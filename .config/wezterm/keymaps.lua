local wezterm = require "wezterm"
local module = {}

function module.config(config)
  config.keys = {
    -- Smart copy using <C-c> (send SIGTERM when not select text)
    {
      key = 'c',
      mods = "CTRL",
      action = wezterm.action_callback(function(window, pane)
          selection_text = window:get_selection_text_for_pane(pane)
          is_selection_active = string.len(selection_text) ~= 0
          if is_selection_active then
              window:perform_action(wezterm.action.CopyTo("ClipboardAndPrimarySelection"), pane)
          else
              window:perform_action(wezterm.action.SendKey{ key='c', mods="CTRL" }, pane)
          end
      end),
    }
  }
end

return module
