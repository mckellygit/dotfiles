local wezterm = require 'wezterm';
return {

  enable_wayland = true,

  font = wezterm.font("JetBrains Mono"),
  font_size = 16.0,

  adjust_window_size_when_changing_font_size = false,

  initial_cols = 194,
  initial_rows = 51,
  line_height = 0.9,

  alternate_buffer_wheel_scroll_speed = 5,

  check_for_updates = true,

  window_background_opacity = 0.97,

  exit_behavior = "Close",
  window_close_confirmation = "NeverPrompt",

  enable_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,

  scrollback_lines = 0,
  enable_scroll_bar = false,

  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 500,

  -- color_scheme = "SpaceGray",

  colors = {
    foreground = "#c5c5c5",
    -- gray
    -- background = "#2e2e26",
    -- blue
    background = "#14292e",

    cursor_fg = "#111111",
    cursor_bg = "#d78700",
    cursor_border = "#d78700",

    selection_fg = "black",
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
      action="OpenLinkAtMouseCursor",
    },
  },

  use_dead_keys = false,
  disable_default_key_bindings = true,
  keys = {
    { key="Backspace", mods="SHIFT",         action=wezterm.action{SendString="\x1e\x08"} },
    { key=" ",         mods="SHIFT",         action=wezterm.action{SendString="\x1e\x20"} },
    { key="Backspace", mods="CTRL",          action=wezterm.action{SendString="\x1e\x7f"} },

    { key="Backspace", mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x7f"} },
    { key=" ",         mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x20"} },
    { key="Backspace", mods="ALT|SHIFT",     action="Nop"},
    { key="Backspace", mods="ALT",           action="Nop"},
    -- these can launch window menu, disable
    { key=" ",         mods="ALT|SHIFT",     action="Nop"},
    { key=" ",         mods="ALT",           action="Nop"},

    -- { key="x",         mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1b\x78"} },

    { key="Backspace", mods="CTRL|ALT",      action=wezterm.action{SendString="\x1b\x40"} },
    { key="=",         mods="CTRL|ALT",      action=wezterm.action{SendString="\x1b\x23"} },
    { key=" ",         mods="CTRL|ALT",      action=wezterm.action{SendString="\x1b\x23"} },
    -- { key="\\",        mods="CTRL|ALT",      action="Nop"},
    { key="\\",        mods="CTRL|ALT",      action="ActivateCopyMode" },

    { key="[",         mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x5b"} },
    { key="{",         mods="CTRL",          action=wezterm.action{SendString="\x1f\x5b"} },

    { key="[",         mods="CTRL|ALT",      action="Nop"},

    { key="]",         mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x5d"} },
    { key="}",         mods="CTRL",          action=wezterm.action{SendString="\x1f\x5d"} },

    { key="]",         mods="CTRL|ALT",      action="Nop"},

    { key="\\",        mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x5c"} },
    { key="|",         mods="CTRL",          action=wezterm.action{SendString="\x1f\x5c"} },

    { key="/",         mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x2f"} },
    { key="?",         mods="CTRL",          action=wezterm.action{SendString="\x1f\x2f"} },

    { key="f",         mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x06"} },
    { key="b",         mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x02"} },

    { key="j",         mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x4a"} },
    { key="k",         mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x4b"} },

    { key="g",         mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x47"} },
    { key="n",         mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x4e"} },
    { key="p",         mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1f\x50"} },

    { key="Insert",    mods="CTRL",          action=wezterm.action{SendString="\x1b[2;5~"} },
    { key="Insert",    mods="SHIFT",         action=wezterm.action{SendString="\x1b[2;2~"} },
    -- { key="c",         mods="CTRL|SHIFT",    action="Copy" },
    -- { key="v",         mods="CTRL|SHIFT",    action="Paste" },
    -- { key="c",         mods="CTRL|SUPER",    action="Copy" },
    -- { key="v",         mods="CTRL|SUPER",    action="Paste" },
    { key="c",         mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1b[2;5~"} },
    { key="v",         mods="CTRL|SHIFT",    action=wezterm.action{SendString="\x1b[2;2~"} },
    { key="c",         mods="CTRL|ALT",      action="Copy" },
    { key="v",         mods="CTRL|ALT",      action="Paste" },

    { key="+",         mods="CTRL",          action="IncreaseFontSize" },
    { key="_",         mods="CTRL",          action="DecreaseFontSize" },
    { key=")",         mods="CTRL",          action="ResetFontSize" },
  }
}
