local palette = {
    fg = "#D4BE98",
    bg = "#1D2021",
    bg_bright = "#EDDEB5",
    overlay = "#3C3836",
    red = "#EA6962",
    green = "#A9B665",
    yellow = "#D8A657",
    blue = "#7DAEA3",
    magenta = "#D3869B",
    cyan = "#89B482",
}

local active_tab = {
    bg_color = palette.overlay,
    fg_color = palette.fg,
}

local inactive_tab = {
    bg_color = palette.bg,
    fg_color = palette.bg_bright,
}

local M = {}

function M.colors()
    return {
        foreground      = palette.fg,
        background      = palette.bg,
        cursor_bg       = palette.fg,
        cursor_border   = palette.fg,
        cursor_fg       = palette.bg,
        selection_bg    = palette.fg,
        selection_fg    = palette.overlay,

        ansi = {
            palette.bg,
            palette.red,
            palette.green,
            palette.yellow,
            palette.blue,
            palette.magenta,
            palette.cyan,
            palette.fg,
        },
        brights = {
            palette.bg_bright,
            palette.red,
            palette.green,
            palette.yellow,
            palette.blue,
            palette.magenta,
            palette.cyan,
            palette.fg,
        },

        tab_bar = {
            background = palette.base,
            active_tab = active_tab,
            inactive_tab = inactive_tab,
            inactive_tab_hover = active_tab,
            new_tab = inactive_tab,
            new_tab_hover = active_tab,
            inactive_tab_edge = palette.muted, -- (Fancy tab bar only)
        },
    }
end

function M.window_frame()
    return {
        active_titlebar_bg = palette.bg,
        inactive_titlebar_bg = palette.bg,
    }
end

return M
