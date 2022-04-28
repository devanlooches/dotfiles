local wezterm = require 'wezterm';

return {
  font = wezterm.font("JetBrainsMono Nerd Font"),
  harfbuzz_features = {"clig=1", "liga=1"},
  default_cursor_style = "BlinkingBar",
  native_macos_fullscreen_mode = true,
  initial_cols = 256,
  initial_rows = 256,
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  disable_default_key_bindings = true,
  keys = {
      {key="mapped:q", mods="CMD", action="QuitApplication"},
      {key="mapped:c", mods="CMD", action="Copy"},
      {key="mapped:v", mods="CMD", action="Paste"},
      {key="mapped:n", mods="CMD", action="SpawnWindow"},
      {key="mapped:Enter", mods="ALT", action="ToggleFullScreen"},
      {key="mapped:-", mods="CMD", action="DecreaseFontSize"},
      {key="mapped:=", mods="CMD", action="IncreaseFontSize"},
      {key="mapped:0", mods="CMD", action="ResetFontSize"},
      {key="mapped:t", mods="CMD", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
      {key="mapped:w", mods="CMD", action=wezterm.action{CloseCurrentTab={confirm=true}}},
      {key="mapped:r", mods="CMD", action="ReloadConfiguration"},
      {key="mapped:Tab", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=-1}},
      {key="mapped:Tab", mods="CTRL", action=wezterm.action{ActivateTabRelative=1}},
    },
}