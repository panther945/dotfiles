local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "tokyonight_moon"
config.font_size = 16
config.initial_rows = 45
config.initial_cols = 160

config.window_padding = { left = 8, right = 8, top = 12, bottom = 8 }
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"

config.adjust_window_size_when_changing_font_size = false
config.show_new_tab_button_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_max_width = 60
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- navigation
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

config.keys = {
	-- move between split panes
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	-- resize panes
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),
}
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	{
		family = "Symbols Nerd Font Mono",
		scale = 1,
	},
})
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_domain = "WSL:Debian"
end

-- tab bar
local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)
	local bg = "#222436"
	local blue = "#82aaff"
	local bg_highlight = "#2f334d"
	local fg_dark = "#828bb8"

	if tab.is_active then
		return {
			{ Text = "" },
			{ Text = title },
			{ Background = { Color = bg } },
			{ Foreground = { Color = blue } },
			{ Text = "" },
		}
	end
	return {
		{ Foreground = { Color = bg } },
		{ Text = "" },
		{ Foreground = { Color = fg_dark } },
		{ Text = title },
		{ Background = { Color = bg } },
		{ Foreground = { Color = bg_highlight } },
		{ Text = "" },
	}
end)

return config
