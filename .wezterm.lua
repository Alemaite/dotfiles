local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_domain = "WSL:Ubuntu"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.window_background_opacity = 1
config.font_size = 11
config.color_scheme = "Catppuccin Mocha"
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

config.tab_max_width = 24

wezterm.on("format-tab-title", function(tab)
	-- 1. If you manually renamed the tab, always use that
	if tab.tab_title and #tab.tab_title > 0 then
		return " " .. tab.tab_title .. " "
	end

	local pane = tab.active_pane

	-- 2. Prefer the current working directory's folder name
	local cwd = pane.current_working_dir
	if cwd then
		local path = cwd
		if type(cwd) == "userdata" then
			path = cwd.file_path
		end
		local folder = tostring(path):gsub("[/\\]+$", ""):match("[^/\\]+$")
		if folder and #folder > 0 then
			return " " .. folder .. " "
		end
	end

	-- 3. Fall back to the process name, stripped of ".exe"
	local name = (pane.foreground_process_name or "shell")
	name = name:match("[^/\\]+$") or name
	name = name:gsub("%.exe$", "")
	return " " .. name .. " "
end)

config.keys = {
	{
		key = "E",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = "Enter new tab name",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{ key = "phys:1", mods = "ALT", action = wezterm.action.ActivateTab(0) },
	{ key = "phys:2", mods = "ALT", action = wezterm.action.ActivateTab(1) },
	{ key = "phys:3", mods = "ALT", action = wezterm.action.ActivateTab(2) },
	{ key = "phys:4", mods = "ALT", action = wezterm.action.ActivateTab(3) },
	{ key = "phys:5", mods = "ALT", action = wezterm.action.ActivateTab(4) },
	{ key = "phys:6", mods = "ALT", action = wezterm.action.ActivateTab(5) },
	{ key = "phys:7", mods = "ALT", action = wezterm.action.ActivateTab(6) },
	{ key = "phys:8", mods = "ALT", action = wezterm.action.ActivateTab(7) },
	{ key = "phys:9", mods = "ALT", action = wezterm.action.ActivateTab(8) },
	{ key = "UpArrow", mods = "CTRL", action = wezterm.action.ScrollByLine(-1) },
	{ key = "DownArrow", mods = "CTRL", action = wezterm.action.ScrollByLine(1) },
}

return config
