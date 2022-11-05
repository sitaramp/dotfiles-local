-- Wezterm configuration
-- Created: 11/12/2021, 21:09:35 +0530
-- Last updated: 31/01/2022, 21:29:38 +0530
-- Windows Location: C:\Users\username\.config\wezterm\wezterm.lua

local wezterm = require "wezterm"

local LEFT_ARROW = utf8.char(0xff0b3)
local SOLID_LEFT_ARROW = utf8.char(0xff0b2)
local SOLID_RIGHT_ARROW = utf8.char(0xff0b0)
local scrollback_lines = 200000;

local COLORS = {
  "#3c1361",
  "#52307c",
  "#663a82",
  "#7c5295",
  "#b491c8"
}

local launch_menu = {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  ssh_cmd = { "C:/Program Files/PowerShell/7/pwsh.exe" }

  table.insert(
    launch_menu,
    {
      label = "PowerShell",
      args = { "C:/Program Files/PowerShell/7/pwsh.exe", "-NoLogo" }
    }
  )

  table.insert(
    launch_menu,
    {
      label = "Bash",
      args = { "C:/Users/spawar/scoop/apps/git/current/bin/bash.exe", "-li" }
    }
  )

  table.insert(
    launch_menu,
    {
      label = "CMD",
      args = { "cmd.exe" }
    }
  )


end

function recompute_padding(window)
  local window_dims = window:get_dimensions()
  local overrides = window:get_config_overrides() or {}
  if not window_dims.is_full_screen then
    if not overrides.window_padding then
      return
    end
    overrides.window_padding = nil
  else
    local third = math.floor(window_dims.pixel_width / 3)
    local new_padding = {
      left = third,
      right = third,
      top = 0,
      bottom = 0
    }
    if overrides.window_padding and new_padding.left == overrides.window_padding.left then
      return
    end
    overrides.window_padding = new_padding
  end
  window:set_config_overrides(overrides)
end

wezterm.on(
  "window-config-reloaded",
  function(window)
    recompute_padding(window)
  end
)

wezterm.on(
  "trigger-nvim-with-scrollback",
  function(window, pane)
    local scrollback = pane:get_lines_as_text(scrollback_lines)
    local name = os.tmpname()
    local f = io.open(name, "w+")
    f:write(scrollback)
    f:flush()
    f:close()
    window:perform_action(wezterm.action { SpawnCommandInNewTab = { args = { "nvim", name } } }, pane)

    wezterm.sleep_ms(1000)
    os.remove(name)
  end
)

wezterm.on(
  "window-resized",
  function(window, pane)
    recompute_padding(window)
  end
)

wezterm.on(
  "open-uri",
  function(window, pane, uri)
    local start, match_end = uri:find("file://")
    if start == 1 then
      local file = uri:sub(match_end + 1)
      window:perform_action(
        wezterm.action { SpawnCommandInNewWindow = { args = { "nu", "-c", "nvim " .. file } } },
        pane
      )
      return false
    end
  end
)


wezterm.on(
  "toggle-opacity",
  function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if not overrides.window_background_opacity then
      overrides.window_background_opacity = 0.5
    else
      overrides.window_background_opacity = nil
    end
    window:set_config_overrides(overrides)
  end
)

local mouse_bindings = {
  -- 右键粘贴
  {
    event = { Down = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = wezterm.action { PasteFrom = "Clipboard" }
  },
  -- Change the default click behavior so that it only selects
  -- text and doesn't open hyperlinks
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = wezterm.action { CompleteSelection = "PrimarySelection" }
  },
  -- and make CTRL-Click open hyperlinks
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = "OpenLinkAtMouseCursor"
  }
}


function font_with_fallback(name, params)
  local names = { name, "Cascadia Mono" }
  return wezterm.font_with_fallback(names, params)
end

wezterm.on(
  "toggle-ligature",
  function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if not overrides.font then
      overrides.font = font_with_fallback("Cascadia Mono", {})
      overrides.font_rules = {
        {
          italic = false,
          intensity = "Normal",
          font = font_with_fallback("Cascadia Mono", {})
        },
        {
          italic = false,
          intensity = "Bold",
          font = font_with_fallback("Cascadia Mono", {})
        },
        {
          italic = true,
          intensity = "Normal",
          font = font_with_fallback("Cascadia Mono", {})
        },
        {
          italic = true,
          intensity = "Bold",
          font = font_with_fallback("Cascadia Mono", {})
        }
      }
    else
      overrides.font = nil
      overrides.font_rules = nil
      overrides.font_antialias = nil
    end
    window:set_config_overrides(overrides)
  end
)


-- local default_prog = { "C:/Windows/System32/wsl.exe" }
local default_prog = { "C:/Program Files/PowerShell/7/pwsh.exe" }

return {

  window_decorations           = "RESIZE",
  native_macos_fullscreen_mode = true,
  tab_max_width                = 16,
  enable_scroll_bar            = true,
  initial_rows                 = 20,
  initial_cols                 = 80,
  window_background_opacity    = 1.0,
  window_padding               = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 5
  },
  text_background_opacity      = 1,

  exit_behavior                              = "Close",
  font_size                                  = 14,
  font                                       = font_with_fallback("Cascadia Mono", {}),

  font_rules                                 = {
    {
      italic = false,
      intensity = "Normal",
      font = font_with_fallback("Cascadia Mono", {})
    },
    {
      italic = false,
      intensity = "Bold",
      font = font_with_fallback("Cascadia Mono", {})
    },
    {
      italic = true,
      intensity = "Normal",
      font = font_with_fallback("Cascadia Mono", {})
    },
    {
      italic = true,
      intensity = "Bold",
      font = font_with_fallback("Cascadia Mono", {})
    }
  },

    window_frame = {
    -- The font used in the tab bar.
    -- Roboto Bold is the default; this font is bundled
    -- with wezterm.
    -- Whatever font is selected here, it will have the
    -- main font setting appended to it to pick up any
    -- fallback fonts you may have used there.
    font = wezterm.font { family = 'Roboto', weight = 'Bold' },

    -- The size of the font in the tab bar.
    -- Default to 10. on Windows but 12.0 on other systems
    font_size = 14.0,

    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = '#333333',

    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = '#333333',
  },
  colors                                     = {
    tab_bar = {
      background = "#0b0022",
      active_tab = {
        bg_color = "#3c1361",
        fg_color = "#c0c0c0",
        intensity = "Normal"
      },
      inactive_tab = {
        bg_color = "#1b1032",
        fg_color = "#808080",
      },
      inactive_tab_hover = {
        bg_color = "#3b3052",
        fg_color = "#909090"
      }
    }
  },

  tab_bar_style                              = {
    active_tab_left = wezterm.format(
      {
        { Background = { Color = "#0b0022" } },
        { Foreground = { Color = "#3c1361" } },
        { Text = SOLID_LEFT_ARROW }
      }
    ),
    active_tab_right = wezterm.format(
      {
        { Background = { Color = "#0b0022" } },
        { Foreground = { Color = "#3c1361" } },
        { Text = SOLID_RIGHT_ARROW }
      }
    ),
    inactive_tab_left = wezterm.format(
      {
        { Background = { Color = "#0b0022" } },
        { Foreground = { Color = "#1b1032" } },
        { Text = SOLID_LEFT_ARROW }
      }
    ),
    inactive_tab_right = wezterm.format(
      {
        { Background = { Color = "#0b0022" } },
        { Foreground = { Color = "#1b1032" } },
        { Text = SOLID_RIGHT_ARROW }
      }
    )
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

  window_close_confirmation                  = "NeverPrompt",
  window_background_image_hsb                = {
    brightness = 0.8,
    hue = 1.0,
    saturation = 1.0
  },

  inactive_pane_hsb                          = {
    brightness = 0.8,
    hue = 1.0,
    saturation = 0.8
  },
  launch_menu                                = launch_menu,
  check_for_updates                          = false,
  enable_tab_bar                             = true,
  show_tab_index_in_tab_bar                  = false,
  adjust_window_size_when_changing_font_size = false,
  mouse_bindings                             = mouse_bindings,
  default_prog                               = default_prog,


    -- color_scheme = "PaperColorDark (Gogh)",
    -- color_scheme = "PaperColor Light (base16)",
    color_scheme = "Gruvbox Dark",
    -- color_scheme = "ayu",

	use_dead_keys = false,
	leader = { key="a", mods="CTRL", timeout_milliseconds = 1000 },
	selection_word_boundary = ' \t\n#$%{}[]()"\'`,;',
	show_tab_index_in_tab_bar = true,
	tab_and_split_indices_are_zero_based = false,
	scroll_to_bottom_on_input = true,

	keys = {

	-- Send "CTRL-A" to the terminal when pression CTRL-A, CTRL-A
	{ key = "a", mods = "LEADER|CTRL", action=wezterm.action.SendString '\x01' },

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
        { key = "9", mods = "LEADER",       action=wezterm.action{ActivateTab=-1}},
        { key = "0", mods = "LEADER",       action="ShowTabNavigator"},
        { key = "`", mods = "LEADER",       action="ActivateLastTab"},
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

}
