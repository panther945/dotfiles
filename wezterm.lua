local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	{ family = "Symbols Nerd Font Mono", scale = 1 },
})

config.color_scheme = "tokyonight_moon"
config.font_size = 16
config.initial_rows = 45
config.initial_cols = 160

config.window_padding = { left = 8, right = 8, top = 12, bottom = 8 }
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.adjust_window_size_when_changing_font_size = false
config.show_new_tab_button_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_max_width = 60
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

return config
