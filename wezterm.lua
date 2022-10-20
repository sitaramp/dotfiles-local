-- Wezterm configuration
-- Created: 11/12/2021, 21:09:35 +0530
-- Last updated: 31/01/2022, 21:29:38 +0530
-- Windows Location: C:\Users\username\.config\wezterm\wezterm.lua

local wezterm = require("wezterm")

-- local font = "JetBrainsMono NF"
 local font = "CaskaydiaCove NF"
-- local font = "FiraCode NF"
-- local font = "Hasklug NF"
-- local font = "Iosevka"
-- local font = "VictorMono Nerd Font"
local config = {
    check_for_updates = false,
    color_scheme = "Gruvbox Dark",
    -- color_scheme = "ayu",
    -- color_scheme = "nightfox",

    inactive_pane_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.0,
    },


	font = wezterm.font(font),
	font_size = 14.0,

	default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe', '-NoLogo' },
	launch_menu = {},

	font_rules = {
		{
			intensity = "Bold",
			font = wezterm.font(font, {
				weight = "Bold",
			}),
		},
		{
			italic = true,
			font = wezterm.font(font, {
				italic = true,
				weight = "Regular",
			}),
		},
	},

	enable_scroll_bar = true,
	scrollback_lines = 5000,


	color_schemes = {
		["tokyonight"] = {
			cursor_bg = "#c0caf5",
			cursor_fg = "#15161e",
			cursor_border = "#c0caf5",

			selection_bg = "#33467c",

			-- background = "#1a1b26",
			background = "#ffffff",
			foreground = "#c0caf5",

			-- black, red, green, yellow, blue, magenta, cyan, white
			ansi = { "#15161e", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
			brights = { "#363b54", "#db4b4b", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5" },
		},
		["nightfox"] = {
			foreground = "#cdcecf",
			background = "#192330",
			cursor_bg = "#cdcecf",
			cursor_border = "#cdcecf",
			cursor_fg = "#192330",
			selection_bg = "#283648",
			selection_fg = "#cdcecf",
			ansi = { "#393b44", "#c94f6d", "#81b29a", "#dbc074", "#719cd6", "#9d79d6", "#63cdcf", "#dfdfe0" },
			brights = { "#7f8c98", "#d6616b", "#58cd8b", "#ffe37e", "#84cee4", "#b8a1e3", "#59f0ff", "#f2f2f2" },
		},
		["nightfly"] = {
			cursor_bg = "#9ca1aa",
			cursor_fg = "#080808",
			cursor_border = "#9ca1aa",

			selection_bg = "#b2ceee",

			background = "#011627",
			foreground = "#acb4c2",

			-- black, red, green, yellow, blue, magenta, cyan, white
			ansi = { "#1d3b53", "#fc514e", "#a1cd5e", "#e3d18a", "#82aaff", "#c792ea", "#7fdbca", "#a1aab8" },
			brights = { "#7c8f8f", "#ff5874", "#21c7a8", "#ecc48d", "#82aaff", "#ae81ff", "#7fdbca", "#d6deeb" },
		},
	},

	use_dead_keys = false,
	leader = { key="b", mods="CTRL" },

	keys = {
		-- New/close pane
		{ key = "c", mods = "LEADER", action=wezterm.action{SpawnTab="CurrentPaneDomain" }},
		{ key = "x", mods = "LEADER", action=wezterm.action{CloseCurrentPane={confirm=true}}},
		-- ALT Enter  ToggleFullScreen

        -- Pane navigation
        { key = "h", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Left"}},
        { key = "j", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Down"}},
        { key = "k", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Up"}},
        { key = "l", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Right"}},
        { key = "LeftArrow", mods = "CTRL", action=wezterm.action{ActivatePaneDirection="Left"}},
        { key = "DownArrow", mods = "CTRL", action=wezterm.action{ActivatePaneDirection="Down"}},
        { key = "UpArrow", mods = "CTRL",   action=wezterm.action{ActivatePaneDirection="Up"}},
        { key = "RightArrow", mods = "CTRL",action=wezterm.action{ActivatePaneDirection="Right"}},

        -- Tab navigation
        { key = "z", mods = "LEADER",       action="TogglePaneZoomState" },
        { key = "1", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
        { key = "2", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
        { key = "3", mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
        { key = "4", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
        { key = "5", mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
        { key = "6", mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
        { key = "7", mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
        { key = "8", mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
        { key = "9", mods = "LEADER",       action=wezterm.action{ActivateTab=8}},
        { key = "0", mods = "LEADER",       action="ShowTabNavigator"},
        { key = "b", mods = "LEADER|CTRL",  action="ActivateLastTab"},
        { key = "LeftArrow", mods = "SHIFT",    action=wezterm.action{ActivateTabRelative=-1}},
        { key = "RightArrow", mods = "SHIFT",   action=wezterm.action{ActivateTabRelative=1}},
        { key = "LeftArrow", mods = "CTRL|SHIFT",    action=wezterm.action{MoveTabRelative=-1}},
        { key = "RightArrow", mods = "CTRL|SHIFT",   action=wezterm.action{MoveTabRelative=1}},

        -- Resize
        { key = "H", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
        { key = "J", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
        { key = "K", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
        { key = "L", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},

        -- Split
        { key = "-", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        { key = "_", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        { key = "\\",mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        { key = "|",mods = "LEADER|SHIFT",  action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},

        -- Scroll/search buffer
        --SHIFT	PageUp	ScrollByPage=-1
        --SHIFT	PageDown	ScrollByPage=1
        --SUPER	k	ClearScrollback="ScrollbackOnly"
        --CTRL+SHIFT	K	ClearScrollback="ScrollbackOnly"
        --SUPER	f	Search={CaseSensitiveString=""}
        --CTRL+SHIFT	F	Search={CaseSensitiveString=""}

        -- Copy/paste buffer
        -- { key = "[",mods = "LEADER",  action="ActivateCopyMode"},
        -- { key = " ",mods = "LEADER",  action="QuickSelect"},
        --SUPER	c	CopyTo="Clipboard"
        --SUPER	v	PasteFrom="Clipboard"
        --CTRL+SHIFT	c	CopyTo="Clipboard"
        --CTRL+SHIFT	v	PasteFrom="Clipboard"
        --CTRL	Insert	CopyTo="PrimarySelection" ()
        --SHIFT	Insert	PasteFrom="PrimarySelection"
        --CTRL+SHIFT	X	ActivateCopyMode
        --CTRL+SHIFT	(Space)	QuickSelect (since: 20210502-130208-bff6815d)

        -- Fonts
        --SUPER	-	DecreaseFontSize
        --CTRL	-	DecreaseFontSize
        --SUPER	=	IncreaseFontSize
        --CTRL	=	IncreaseFontSize
        --SUPER	0	ResetFontSize
        --CTRL	0	ResetFontSize
        --CTRL	Z	TogglePaneZoomState

        -- Misc
        --SUPER	r	ReloadConfiguration
        --CTRL+SHIFT	R	ReloadConfiguration
        --CTRL+SHIFT	L	ShowDebugOverlay (Since: 20210814-124438-54e29167)
		{
			key = "2",
			mods = "CTRL|SHIFT",
			action = wezterm.action({
				SpawnCommandInNewTab = {
					label = "PowerShell",
--					args = { "C:\\Program Files\\PowerShell\\7-preview\\pwsh.exe -NoExit -WorkingDirectory ~" }, 
					args = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe -NoExit -WorkingDirectory ~" },
				},
			}),
		},
		{
			key = "F11",
			action = "ToggleFullScreen",
		},
	},

    -- Tab bar appearance
    --[[
    colors = {
        tab_bar = {

            -- The color of the strip that goes along the top of the window
            background = "#282828",

            -- The active tab is the one that has focus in the window
            active_tab = {
                -- The color of the background area for the tab
                bg_color = "#282828",
                -- The color of the text for the tab
                fg_color = "#fe8019",
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false,
            },

            -- Inactive tabs are the tabs that do not have focus
            inactive_tab = {
                bg_color = "#282828",
                fg_color = "#a89984",
            },
            inactive_tab_hover = {
                bg_color = "#282828",
                fg_color = "#a89984",
            },

            new_tab = {
                bg_color = "#282828",
                fg_color = "#458588",
            },
            new_tab_hover = {
                bg_color = "#282828",
                fg_color = "#808080",
            },
        },
    },
    --]]
}

return config
