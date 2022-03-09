local wezterm = require 'wezterm';
return {

  -- NOTE: requires the termwiz/data/wezterm.terminfo compiled and installed ...
  -- term = "wezterm",

  enable_wayland = false,

  audible_bell = "Disabled",

  visual_bell = {
    fade_in_duration_ms = 5,
    fade_out_duration_ms = 5,
    target = "CursorColor",
  },

  bold_brightens_ansi_colors = true,

  font = wezterm.font("JetBrains Mono"),
  -- if wayland then 16.0
  -- font_size = 16.0,
  font_size = 12.6,

  adjust_window_size_when_changing_font_size = false,

  initial_cols = 194,
  initial_rows = 51,
  line_height = 0.9,

  alternate_buffer_wheel_scroll_speed = 5,

  check_for_updates = true,

  window_background_opacity = 0.97,

  exit_behavior = "Close",
  window_close_confirmation = "AlwaysPrompt",

  swallow_mouse_click_on_pane_focus = true,

  enable_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,

  scrollback_lines = 0,
  enable_scroll_bar = false,

  -- default_cursor_style = "SteadyBlock",
  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 800,
  -- needed to prevent 'easing' from using 40%+ cpu util ...
  animation_fps = 1,

  -- max_fps = 60,

  -- color_scheme = "SpaceGray",

  colors = {
    foreground = "#c5c5c5",
    -- gray
    -- background = "#2e2e26",
    -- blue
    background = "#14292e",

    -- cursor_fg = "#111111",
    cursor_fg = "#ffffff",
    cursor_bg = "#d78700",
    cursor_border = "#d78700",

    selection_fg = "#000000",
    selection_bg = "#fffacd",

    -- ansi =    { "#000000", "#cc0403", "#19cb00", "#cecb00", "#5f87ff", "#ba55d3", "#0dcdcd", "#dddddd" },
    -- brights = { "#767676", "#f2201f", "#23fd00", "#fffd00", "#0066ff", "#875faf", "#14ffff", "#ffffff" },
    ansi =    { "#000000", "#b22222", "#008000", "#999900", "#0066ff", "#ba55d3", "#009999", "#dddddd" },
    brights = { "#808080", "#df0000", "#00d700", "#ffd700", "#5f87ff", "#875faf", "#00ffff", "#ffffff" },
  },

  bypass_mouse_reporting_modifiers = "SHIFT",
  disable_default_mouse_bindings = false,

  mouse_bindings = {
    {
      event={Up={streak=1, button="Left"}},
      mods="SHIFT",
      -- NOTE: if firefox is not already open then this starts firefox but then blocks until firefox exits
      action="OpenLinkAtMouseCursor",
    },
  },

  enable_csi_u_key_encoding = false,

  use_dead_keys = false,
  disable_default_key_bindings = true,
  keys = {
    { key="phys:Backspace", mods="SHIFT",         action=wezterm.action{SendString="\x1e\x08"} },
    { key="phys:Space",     mods="SHIFT",         action=wezterm.action{SendString="\x1e\x20"} },
    { key="phys:Backspace", mods="CTRL",          action=wezterm.action{SendString="\x1e\x7f"} },

    { key="phys:Backspace", mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x7f"} },
    { key="phys:Space",     mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x20"} },
    { key="phys:Backspace", mods="ALT|SHIFT",     action="Nop"},
    { key="phys:Backspace", mods="ALT",           action="Nop"},
    -- these can launch window menu, disable
    { key="phys:Space",     mods="ALT|SHIFT",     action="Nop"},
    { key="phys:Space",     mods="ALT",           action="Nop"},

    -- { key="x",              mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1b\x78"} },

    { key="phys:Backspace", mods="CTRL|ALT",      action=wezterm.action{SendString="\x1b\x40"} },
    -- { key="=",              mods="CTRL|ALT",      action=wezterm.action{SendString="\x1b\x23"} },
    { key="phys:Equal",     mods="CTRL|ALT",      action=wezterm.action{SendString="\x1b\x23"} },
    { key="phys:Space",     mods="CTRL|ALT",      action=wezterm.action{SendString="\x1b\x23"} },
    -- { key="\\",             mods="CTRL|ALT",      action="Nop"},
    { key="\\",             mods="CTRL|ALT",      action="ActivateCopyMode" },

    { key="phys:Return",mods="CTRL|ALT",      action=wezterm.action{SendString="\x1e\x0d"} },

    { key="[",          mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x5b"} },
    { key="{",          mods="CTRL",          action=wezterm.action{SendString="\x1f\x5b"} },

    { key="[",          mods="CTRL|ALT",      action="Nop"},

    { key="]",          mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x5d"} },
    { key="}",          mods="CTRL",          action=wezterm.action{SendString="\x1f\x5d"} },

    { key="]",          mods="CTRL|ALT",      action="Nop"},

    { key="\\",         mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x5c"} },
    { key="|",          mods="CTRL",          action=wezterm.action{SendString="\x1f\x5c"} },

    { key="/",          mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x2f"} },
    { key="?",          mods="CTRL",          action=wezterm.action{SendString="\x1f\x2f"} },

    { key="f",          mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x06"} },
    { key="b",          mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x02"} },

    { key="j",          mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x4a"} },
    { key="k",          mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x4b"} },

    { key="g",          mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x47"} },
    { key="n",          mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x4e"} },
    { key="p",          mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x50"} },

    -- { key="x",          mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x58"} },
    -- old idea was to send M-( \x1b\x28, could also consider <C-_><C-x> \x1f\x18

    { key="Insert",     mods="CTRL",          action=wezterm.action{SendString="\x1b[2;5~"} },
    { key="Insert",     mods="SHIFT",         action=wezterm.action{SendString="\x1b[2;2~"} },
    -- { key="c",          mods="CTRL|SHIFT",    action="Copy" },
    -- { key="v",          mods="CTRL|SHIFT",    action="Paste" },
    -- { key="c",          mods="CTRL|SUPER",    action="Copy" },
    -- { key="v",          mods="CTRL|SUPER",    action="Paste" },
    { key="c",          mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1b[2;5~"} },
    { key="v",          mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1b[2;2~"} },
    { key="c",          mods="CTRL|ALT",      action="Copy" },
    { key="v",          mods="CTRL|ALT",      action="Paste" },

    { key="phys:Minus", mods="CTRL",          action=wezterm.action{SendString="\x1e\x2d"} },

    -- { key="+",          mods="CTRL",          action="IncreaseFontSize" },
    -- { key="_",          mods="CTRL",          action="DecreaseFontSize" },
    -- { key=")",          mods="CTRL",          action="ResetFontSize" },
    { key="phys:Equal", mods="CTRL|SHIFT",    action="IncreaseFontSize" },
    { key="phys:Minus", mods="CTRL|SHIFT",    action="DecreaseFontSize" },
    { key="phys:0",     mods="CTRL|SHIFT",    action="ResetFontSize" },
  }
}
