local wezterm = require "wezterm"
local module = {}
local act = wezterm.action

function module.config(config)
  config.keys = {
    -- smart copy using <C-c> (send SIGTERM when not select text)
    {
      key = 'c',
      mods = "CTRL",
      action = wezterm.action_callback(function(window, pane)
          selection_text = window:get_selection_text_for_pane(pane)
          is_selection_active = string.len(selection_text) ~= 0
          if is_selection_active then
              window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
          else
              window:perform_action(act.SendKey{ key='c', mods="CTRL" }, pane)
          end
      end),
    },
    -- switch tabs
    {
      key = '1',
      mods = "ALT",
      action = act {ActivateTab = 0}
    },
    {
      key = '2',
      mods = "ALT",
      action = act {ActivateTab = 1}
    },
    {
      key = '3',
      mods = "ALT",
      action = act {ActivateTab = 2}
    },
    {
      key = '4',
      mods = "ALT",
      action = act {ActivateTab = 3}
    },
    {
      key = '5',
      mods = "ALT",
      action = act {ActivateTab = 4}
    },
    {
      key = '6',
      mods = "ALT",
      action = act {ActivateTab = 5}
    },
    {
      key = '7',
      mods = "ALT",
      action = act {ActivateTab = 6}
    },
    {
      key = '8',
      mods = "ALT",
      action = act {ActivateTab = 7}
    },
    {
      key = '9',
      mods = "ALT",
      action = act {ActivateTab = 8}
    },
    {
      key = '0',
      mods = "ALT",
      action = act {ActivateTab = 9}
    },
  }
end

return module
