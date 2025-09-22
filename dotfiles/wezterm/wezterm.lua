local function scheme_for_appearance(appearance)
    if appearance:find "Dark" then
        return "Catppuccin Macchiato"
    else
        return "Catppuccin Latte"
    end
end

local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Basic configuration
config.initial_cols = 105
config.initial_rows = 30


-- Style
config.default_cursor_style = 'BlinkingUnderline'
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.font =
    wezterm.font('JetBrainsMono Nerd Font', { weight = 'Bold', italic = false })

-- Window specific
config.window_close_confirmation = 'NeverPrompt'
config.window_background_opacity = 0.85
config.hide_tab_bar_if_only_one_tab = true

config.macos_window_background_blur = 50

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
    left = '1cell',
    right = '1cell',
    top = '1.7cell',
    bottom = '0.5cell',
}

config.window_frame = {
    border_left_width = '1px',
    border_right_width = '1px',
    border_bottom_height = '1px',
    border_top_height = '0px',
    border_left_color = '#484848',
    border_right_color = '#484848',
    border_bottom_color = '#484848',
    border_top_color = '#484848',
}


config.keys = {
    -- Natural text editing keybinds
    -- Move one word/agrument left/right
    { mods = "OPT", key = "LeftArrow",  action = wezterm.action.SendKey({ mods = "ALT", key = "b" }) },
    { mods = "OPT", key = "RightArrow", action = wezterm.action.SendKey({ mods = "ALT", key = "f" }) },
    -- Move all the way left/right
    { mods = "CMD", key = "LeftArrow",  action = wezterm.action.SendKey({ mods = "CTRL", key = "a" }) },
    { mods = "CMD", key = "RightArrow", action = wezterm.action.SendKey({ mods = "CTRL", key = "e" }) },
    -- Delete all characters with CMD + Backspace
    { mods = "CMD", key = "Backspace",  action = wezterm.action.SendKey({ mods = "CTRL", key = "u" }) }
}

return config
