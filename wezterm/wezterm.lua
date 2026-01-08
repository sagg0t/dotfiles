local wezterm = require("wezterm")
local colors = require("lua.sigma.sigma").colors()
local window_frame = require("lua.sigma.sigma").window_frame()
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local act = wezterm.action

local config = wezterm.config_builder()
config.term = "wezterm"

config.keys = {
    { key = "f", mods = "SUPER|SHIFT", action = workspace_switcher.switch_workspace() },
    { key = "[", mods = "SUPER|SHIFT", action = act.MoveTabRelative(-1) },
    { key = "]", mods = "SUPER|SHIFT", action = act.MoveTabRelative(1) },
    { key = "w", mods = "SUPER",       action = act.CloseCurrentTab({ confirm = true }) },
    { key = "s", mods = "SUPER",       action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "S", mods = "SUPER",       action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "u", mods = "SUPER",       action = act.ScrollByPage(-0.5) },
    { key = "d", mods = "SUPER",       action = act.ScrollByPage(0.5) },
    { key = "h", mods = "SUPER",       action = act.ActivatePaneDirection("Left") },
    { key = "H", mods = "SUPER",       action = act.AdjustPaneSize({ "Left", 3 }) },
    { key = "j", mods = "SUPER",       action = act.ActivatePaneDirection("Down") },
    { key = "J", mods = "SUPER",       action = act.AdjustPaneSize({ "Down", 3 }) },
    { key = "k", mods = "SUPER",       action = act.ActivatePaneDirection("Up") },
    { key = "K", mods = "SUPER",       action = act.AdjustPaneSize({ "Up", 3 }) },
    { key = "l", mods = "SUPER",       action = act.ActivatePaneDirection("Right") },
    { key = "L", mods = "SUPER",       action = act.AdjustPaneSize({ "Right", 3 }) },
    { key = "L", mods = "SUPER|ALT",   action = act.ShowDebugOverlay },

    {
        key = "r",
        mods = "SUPER|ALT",
        action = act.PromptInputLine({
            description = "Enter new name for the tab",
            initial_value = nil,
            action = wezterm.action_callback(function(window, pane, line)
                if (not line) or line == "" then return end

                window:active_tab():set_title(line)
            end),
        }),
    },

    { key = "=",          mods = "SUPER",          action = act.ResetFontSize },
    { key = "+",          mods = "SUPER",          action = act.IncreaseFontSize },

    { key = "!",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "!",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "@",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "@",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "\"",         mods = "CTRL|ALT",       action = act.DisableDefaultAssignment },
    { key = "\"",         mods = "CTRL|ALT|SHIFT", action = act.DisableDefaultAssignment },
    { key = "\"",         mods = "SUPER",          action = act.DisableDefaultAssignment },
    { key = "#",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "#",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "$",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "$",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "%",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "%",          mods = "CTRL|ALT",       action = act.DisableDefaultAssignment },
    { key = "%",          mods = "CTRL|ALT|SHIFT", action = act.DisableDefaultAssignment },
    { key = "%",          mods = "CTRL|SHIFT",     action = act.DisableDefaultAssignment },
    { key = "^",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "^",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "&",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "&",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "=",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "=",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "+",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "+",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "-",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "-",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "_",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "_",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "\"",         mods = "SHIFT|ALT|CTRL", action = act.DisableDefaultAssignment },
    { key = "(",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "(",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = ")",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = ")",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "*",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "*",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "H",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "H",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "L",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "L",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "R",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "R",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "r",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "w",          mods = "CTRL|SHIFT",     action = act.DisableDefaultAssignment },

    { key = "0",          mods = "SUPER",          action = act.ActivateTab(0) },
    { key = "1",          mods = "SUPER",          action = act.ActivateTab(1) },
    { key = "2",          mods = "SUPER",          action = act.ActivateTab(2) },
    { key = "3",          mods = "SUPER",          action = act.ActivateTab(3) },
    { key = "4",          mods = "SUPER",          action = act.ActivateTab(4) },
    { key = "5",          mods = "SUPER",          action = act.ActivateTab(5) },
    { key = "6",          mods = "SUPER",          action = act.ActivateTab(6) },
    { key = "7",          mods = "SUPER",          action = act.ActivateTab(7) },
    { key = "8",          mods = "SUPER",          action = act.ActivateTab(8) },
    { key = "9",          mods = "SUPER",          action = act.ActivateTab(-1) },

    { key = "0",          mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "0",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "1",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "2",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "3",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "4",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "5",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "5",          mods = "CTRL|ALT|SHIFT", action = act.DisableDefaultAssignment },
    { key = "6",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "7",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "8",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "9",          mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "PageUp",     mods = "SHIFT",          action = act.DisableDefaultAssignment },
    { key = "PageUp",     mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "PageUp",     mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "PageDown",   mods = "SHIFT",          action = act.DisableDefaultAssignment },
    { key = "PageDown",   mods = "CTRL",           action = act.DisableDefaultAssignment },
    { key = "PageDown",   mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "LeftArrow",  mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "LeftArrow",  mods = "SHIFT|ALT|CTRL", action = act.DisableDefaultAssignment },
    { key = "RightArrow", mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "RightArrow", mods = "SHIFT|ALT|CTRL", action = act.DisableDefaultAssignment },
    { key = "UpArrow",    mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "UpArrow",    mods = "SHIFT|ALT|CTRL", action = act.DisableDefaultAssignment },
    { key = "DownArrow",  mods = "SHIFT|CTRL",     action = act.DisableDefaultAssignment },
    { key = "DownArrow",  mods = "SHIFT|ALT|CTRL", action = act.DisableDefaultAssignment },

    { key = "F1",         mods = "SUPER",          action = act.Nop },
    { key = "F2",         mods = "SUPER",          action = act.Nop },
}

config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.bypass_mouse_reporting_modifiers = "CMD"
config.max_fps = 120
config.scrollback_lines = 10000
config.hide_tab_bar_if_only_one_tab = true
config.tab_and_split_indices_are_zero_based = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.macos_window_background_blur = 30
config.native_macos_fullscreen_mode = true

config.font_size = 16

-- config.font = wezterm.font("CodeNewRoman Nerd Font")
-- config.font = wezterm.font("Hack Nerd Font")
config.font = wezterm.font("Monaspace Neon") -- neo-grotesque sans
-- config.font = wezterm.font("Monaspace Argon Var") -- humanist sans
-- config.font = wezterm.font("Monaspace Xenon Var") -- serif
-- config.font = wezterm.font("Monaspace Radon Var") -- handwriting
-- config.font = wezterm.font("Monaspace Krypton Var") -- mechanical sans

config.harfbuzz_features = {
    "calt", "liga", "dlig",
    "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08", "ss09"
}

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
            -- File = wezterm.home_dir .. "/Pictures/wallpapers/ahri_spirit_blossom_art.jpg"
            -- File = wezterm.home_dir .. "/Pictures/wallpapers/mythra_art_light.jpg"
            File = wezterm.home_dir .. "/Pictures/art/Mythra/smash_wall.jpg"
        },
        opacity = 0.7
    },
    {
        source = {
            Color = colors.background
        },
        width = "100%",
        height = "100%",
        opacity = 0.85
    }
}

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
        { Text = string.format("[%s]", tab.tab_index) }
    })

    local title = tab.tab_title
    if title == "" then
        title = string.gsub(
            tab.active_pane.foreground_process_name,
            "(.*[/\\])(.*)",
            "%2"
        )
    end

    return string.format(" %s %s ", tab_index, title)
end)

wezterm.on("update-right-status", function(window, pane)
    window:set_right_status(
        wezterm.format({
            { Foreground = { Color = colors.ansi[6] } },
            { Attribute = { Intensity = "Bold" } },
            { Text = string.gsub(window:active_workspace(), "(.*[/\\])(.*)", "%2") }
        })
    )
end)

return config
