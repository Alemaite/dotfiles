local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_domain = 'WSL:Ubuntu'
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.window_background_opacity = 0.8
config.font_size = 11
config.color_scheme = 'Catppuccin Mocha'
config.hide_tab_bar_if_only_one_tab = true

return config