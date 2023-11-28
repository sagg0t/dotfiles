local wezterm = require("wezterm")
local rosepineColors = require("lua.rose-pine.rose-pine").colors()
local window_frame = require("lua.rose-pine.rose-pine").window_frame()

local config = wezterm.config_builder()

config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.bypass_mouse_reporting_modifiers = "CMD"
config.max_fps = 120
config.hide_tab_bar_if_only_one_tab = true
config.macos_window_background_blur = 30

config.font_size = 18
config.harfbuzz_features = {
    "calt", "liga", "dlig",
    "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08",
}

-- config.font = wezterm.font("Monaspace Neon Var") -- neo-grotesque sans
config.font = wezterm.font("Monaspace Argon Var", { weight = "Bold", }) -- humanist sans
-- config.font = wezterm.font("Monaspace Xenon Var") -- serif
-- config.font = wezterm.font("Monaspace Radon Var") -- handwriting
-- config.font = wezterm.font("Monaspace Krypton Var") -- mechanical sans
config.font_rules = {
    {
        intensity = "Normal",
        italic = true,
        font = wezterm.font("Monaspace Neon Var", { weight = "Bold" })
    }
}

config.colors = rosepineColors
config.window_frame = window_frame
config.window_padding = {
    left = "5px",
    top = 0,
    right = 0,
    bottom = 0
}

config.background = {
    {
        source = {
            File = "/Users/sagg0t/Pictures/wallpapers/ahri_spirit_blossom_art.jpg"
        },
        opacity = 0.6
    },
    {
        source = {
            Color = rosepineColors.background
        },
        width = "100%",
        height = "100%",
        opacity = 0.9
    }
}

return config
