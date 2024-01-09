-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.font = wezterm.font_with_fallback({
  { family = "Inconsolata",  scale = 1 },
  { family = "Arial", scale = 1 },
})
config.warn_about_missing_glyphs = false
config.color_scheme = 'Solarized (dark) (terminal.sexy)'
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 40000
config.default_workspace = "home"

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.7,
  brightness = 0.5
}

-- Keys
-- config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  { key = "=", mods = "ALT",       action = act.ActivateCopyMode },
  -- { key = "c", mods = 'NONE', action = act.CopyMode 'MoveLeft' },
  -- { key = "t", mods = 'NONE', action = act.CopyMode 'MoveDown' },
  -- { key = "s", mods = 'NONE', action = act.CopyMode 'MoveUp' },
  -- { key = "r", mods = 'NONE', action = act.CopyMode 'MoveRight' },

  -- Pane keybindings
  { key = "-", mods = "ALT",       action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  -- SHIFT is for when caps lock is on
  { key = "/", mods = "ALT", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "c", mods = "ALT",       action = act.ActivatePaneDirection("Left") },
  { key = "t", mods = "ALT",       action = act.ActivatePaneDirection("Down") },
  { key = "s", mods = "ALT",       action = act.ActivatePaneDirection("Up") },
  { key = "r", mods = "ALT",       action = act.ActivatePaneDirection("Right") },
  { key = "d", mods = "ALT",       action = act.CloseCurrentPane { confirm = true } },
  { key = "f", mods = "ALT",       action = act.TogglePaneZoomState },
  { key = "l", mods = "ALT",    action = act.ActivateKeyTable { name = "resize_pane", one_shot = false } },

  -- Tab keybindings
  { key = "n", mods = "ALT",       action = act.SpawnTab("CurrentPaneDomain") },
  { key = "c", mods = "SHIFT|ALT",       action = act.ActivateTabRelative(-1) },
  { key = "c", mods = "CTRL|ALT",       action = act.ActivateTabRelative(-1) },
  { key = "r", mods = "SHIFT|ALT",       action = act.ActivateTabRelative(1) },
  { key = "r", mods = "CTRL|ALT",       action = act.ActivateTabRelative(1) },
  { key = "m", mods = "ALT",       action = act.ActivateKeyTable { name = "move_tab", one_shot = false } },

  -- Workspaces
  { key = "w", mods = "ALT",       action = act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" } },
}

for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "ALT",
    action = act.ActivateTab(i - 1)
  })
end

config.key_tables = {
  resize_pane = {
    { key = "c",      action = act.AdjustPaneSize { "Left", 1 } },
    { key = "t",      action = act.AdjustPaneSize { "Down", 1 } },
    { key = "s",      action = act.AdjustPaneSize { "Up", 1 } },
    { key = "r",      action = act.AdjustPaneSize { "Right", 1 } },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" },
  },
  move_tab = {
    { key = "c",      action = act.MoveTabRelative(-1) },
    { key = "t",      action = act.MoveTabRelative(-1) },
    { key = "s",      action = act.MoveTabRelative(1) },
    { key = "r",      action = act.MoveTabRelative(1) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" },
  },
  copy_mode = {
    { key = 'Tab', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
    { key = 'Tab', mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'Enter', mods = 'NONE', action = act.CopyMode 'MoveToStartOfNextLine' },
    { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
    { key = 'Space', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
    { key = '$', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = ',', mods = 'NONE', action = act.CopyMode 'JumpReverse' },
    { key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
    { key = ';', mods = 'NONE', action = act.CopyMode 'JumpAgain' },
    { key = 'F', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
    { key = 'F', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
    { key = 'G', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'G', mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'H', mods = 'NONE', action = act.CopyMode 'MoveToViewportTop' },
    { key = 'H', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
    { key = 'L', mods = 'NONE', action = act.CopyMode 'MoveToViewportBottom' },
    { key = 'L', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
    { key = 'M', mods = 'NONE', action = act.CopyMode 'MoveToViewportMiddle' },
    { key = 'M', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
    { key = 'O', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'O', mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'T', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
    { key = 'T', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
    { key = 'V', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Line' } },
    { key = 'V', mods = 'SHIFT', action = act.CopyMode{ SetSelectionMode =  'Line' } },
    { key = '^', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = '^', mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'b', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'b', mods = 'CTRL', action = act.CopyMode 'PageUp' },
    { key = 'c', mods = 'CTRL', action = act.CopyMode 'Close' },
    { key = 'd', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (0.5) } },
    { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWordEnd' },
    { key = 'f', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = false } } },
    { key = 'f', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
    { key = 'f', mods = 'CTRL', action = act.CopyMode 'PageDown' },
    { key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
    { key = 'g', mods = 'CTRL', action = act.CopyMode 'Close' },
    { key = 'c', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
    { key = 't', mods = 'NONE', action = act.CopyMode 'MoveDown' },
    { key = 's', mods = 'NONE', action = act.CopyMode 'MoveUp' },
    { key = 'r', mods = 'NONE', action = act.CopyMode 'MoveRight' },
    { key = 'm', mods = 'ALT', action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = 'o', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEnd' },
    { key = 'q', mods = 'NONE', action = act.CopyMode 'Close' },
    -- { key = 't', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = true } } },
    { key = 'u', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (-0.5) } },
    { key = 'v', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
    { key = 'v', mods = 'CTRL', action = act.CopyMode{ SetSelectionMode =  'Block' } },
    { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
    { key = 'y', mods = 'NONE', action = act.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { CopyMode =  'Close' } } },
    { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PageUp' },
    { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'PageDown' },
    { key = 'End', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = 'Home', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
    { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
    { key = 'LeftArrow', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
    { key = 'RightArrow', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
    { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
    { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
  }}  -- copy_mode = {
  --   { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
  --   { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
  --   { key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
  --   { key = 'u', mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
  --   { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
  --   { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
  --   { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
  --   { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
  --   { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
  --   { key = 'Enter', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
  -- },}


config.ssh_domains = {
  {
    name = 'glargh',
    remote_address = 'glargh',
    username = 'nabos',
  },
}

-- Tab bar
-- I don't like the look of "fancy" tab bar
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
wezterm.on("update-right-status", function(window, pane)
  -- Workspace name
  local stat = window:active_workspace()
  -- It's a little silly to have workspace name all the time
  -- Utilize this to display LDR or current key table name
  if window:active_key_table() then stat = window:active_key_table() end
  if window:leader_is_active() then stat = "LDR" end

  -- Current working directory
  local basename = function(s)
    -- Nothign a little regex can't fix
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
  end
  local cwd = basename(pane:get_current_working_dir())
  -- Current command
  local cmd = basename(pane:get_foreground_process_name())

  -- Time
  local time = wezterm.strftime("%H:%M")

  -- Let's add color to one of the components
  window:set_right_status(wezterm.format({
    -- Wezterm has a built-in nerd fonts
    { Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
    { Text = " | " },
    { Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
    { Text = " | " },
    { Foreground = { Color = "FFB86C" } },
    { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
    "ResetAttributes",
    { Text = " | " },
    { Text = wezterm.nerdfonts.md_clock .. "  " .. time },
    { Text = " |" },
  }))
end)

return config
