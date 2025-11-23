-- See https://wezfurlong.org/wezterm/

local wezterm = require 'wezterm'

return {
  enable_tab_bar = false,
  font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Light'}),
  font_size = 13,
  color_scheme = "Monokai Remastered",

  initial_cols = 120,
  initial_rows = 40,

  -- Window
  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  },
}
