local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
local mouse_bindings = {}
local launch_menu = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.enable_wayland = true
config.bypass_mouse_reporting_modifiers = "CTRL"
config.color_scheme_dirs = { "~/.config/wezterm" }
config.color_scheme = "tokyonight_night"
config.font = wezterm.font_with_fallback({ "Hack Nerd Font", "Noto Sans Symbols 2" })
config.font_size = 14
config.default_cursor_style = "BlinkingBlock"
config.launch_menu = launch_menu
config.foreground_text_hsb = {
	hue = 1.0,
	saturation = 1.2,
	brightness = 1.5,
}
config.enable_tab_bar = false
config.default_domain = "WSL:Ubuntu"

-- Combine all key bindings here
config.keys = {
	{ key = "V", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "C", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
	{ key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard") },
	{ key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard") },
	{ key = "Home", mods = "", action = wezterm.action.SendKey({ key = "Home" }) },
	{ key = "End", mods = "", action = wezterm.action.SendKey({ key = "End" }) },
}

-- Adjusted mouse bindings
config.mouse_bindings = {
	{
		event = { Down = { streak = 3, button = "Left" } },
		action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
		mods = "NONE",
	},
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act.PasteFrom("Clipboard"), pane)
			end
		end),
	},
}

return config
