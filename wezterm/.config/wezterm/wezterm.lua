local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()
local mux = wezterm.mux

-- local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.max_fps = 120
config.window_padding = { left = 8, right = 8, top = 12, bottom = 8 }
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 60
config.show_new_tab_button_in_tab_bar = false
config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Tokyo Night Moon"
-- config.color_scheme = "tokyonight_moon"
config.font_size = 16
config.initial_cols = 180
config.initial_rows = 45
-- config.line_height = 1.0
config.font = wezterm.font_with_fallback({
	{
		family = "JetBrains Mono",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	},
	"Symbols Nerd Font Mono",
})
config.window_close_confirmation = "NeverPrompt"

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_domain = "WSL:Debian"
end

config.keys = {}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CMD",
		action = act.SendKey({ key = tostring(i), mods = "ALT" }),
	})
end

local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

-- config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
-- config.keys = {
-- 	{
-- 		key = "|",
-- 		mods = "LEADER",
-- 		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
-- 	},
-- 	{
-- 		key = "-",
-- 		mods = "LEADER",
-- 		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
-- 	},
-- 	{
-- 		key = "p",
-- 		mods = "LEADER",
-- 		action = workspace_switcher.switch_workspace({ extra_args = " | rg -Fxf ~/works" }),
-- 	},
-- 	-- move between split panes
-- 	split_nav("move", "h"),
-- 	split_nav("move", "j"),
-- 	split_nav("move", "k"),
-- 	split_nav("move", "l"),
-- 	-- -- -- resize panes
-- 	split_nav("resize", "h"),
-- 	split_nav("resize", "j"),
-- 	split_nav("resize", "k"),
-- 	split_nav("resize", "l"),
-- }

-- workspace_switcher.zoxide_path = "/opt/homebrew/bin/zoxide"
-- workspace_switcher.apply_to_config(config)

return config
