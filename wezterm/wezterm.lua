local wezterm = require("wezterm")
local colors = require("lua.sigma.sigma").colors()
local window_frame = require("lua.sigma.sigma").window_frame()

local config = wezterm.config_builder()
config.keys = {}

config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.bypass_mouse_reporting_modifiers = "CMD"
config.max_fps = 120
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.macos_window_background_blur = 30
config.native_macos_fullscreen_mode = true

config.font_size = 19

config.harfbuzz_features = {
    "calt", "liga", "dlig",
    "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08",
}

config.font = wezterm.font("CodeNewRoman Nerd Font")
-- config.font = wezterm.font("Hack Nerd Font")
-- config.font = wezterm.font("Monaspace Neon Var") -- neo-grotesque sans
-- config.font = wezterm.font("Monaspace Argon Var") -- humanist sans
-- config.font = wezterm.font("Monaspace Xenon Var") -- serif
-- config.font = wezterm.font("Monaspace Radon Var") -- handwriting
-- config.font = wezterm.font("Monaspace Krypton Var") -- mechanical sans

config.colors = colors
config.window_frame = window_frame
config.window_padding = {
    left = 0,
    top = 0,
    right = 0,
    bottom = 0
}

config.background = {
    {
        source = {
            -- File = "/Users/oleh/Pictures/wallpapers/ahri_spirit_blossom_art.jpg"
            File = "/Users/sagg0t/Pictures/wallpapers/mythra_art_light.jpg"
        },
        opacity = 0.55
    },
    {
        source = {
            Color = colors.background
        },
        width = "100%",
        height = "100%",
        opacity = 0.9
    }
}

local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
table.insert(config.keys, { key = "s", mods = "CTRL|SHIFT", action = workspace_switcher.switch_workspace() })
table.insert(config.keys, { key = "t", mods = "CTRL|SHIFT", action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) })
table.insert(config.keys, { key = "[", mods = "CTRL|SHIFT", action = wezterm.action.SwitchWorkspaceRelative(1) })

local function get_current_working_dir(tab)
    local current_dir = tab.active_pane and tab.active_pane.current_working_dir or { file_path = "" }
    local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

    return current_dir == HOME_DIR and "." or string.gsub(current_dir.file_path, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local index_color
    if tab.is_active then
        index_color = colors.tab_bar.active_tab.fg_color
    else
        index_color = colors.tab_bar.inactive_tab.fg_color
    end

    local tab_index = wezterm.format({
        { Foreground = { Color = index_color } },
        { Attribute = { Intensity = "Bold" } },
        { Text = string.format("[%s]", tab.tab_index + 1) }
    })

    local title = tab.tab_title or get_current_working_dir(tab)

    return string.format(" %s %s ", tab_index, title)
end)

wezterm.on("update-right-status", function(window, pane)
    window:set_right_status(
        wezterm.format({
            { Foreground = { Color = colors.ansi[6] } },
            { Attribute = { Intensity = "Bold" } },
            { Text = window:active_workspace() }
        })
    )
end)

return config
