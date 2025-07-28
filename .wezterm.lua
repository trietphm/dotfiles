local wezterm = require 'wezterm'
local config = {}
--config.leader = { key="a", mods="CTRL" }
config.hide_tab_bar_if_only_one_tab = true
config.keys = {
      { key = "Escape", mods = "SHIFT",  action=wezterm.action{SendString="~"}},
--    { key = "a", mods = "LEADER|CTRL",  action=wezterm.action{SendString="\x01"}},
--    { key = "-", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
--    { key = "\\",mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
--    { key = "v", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
--    { key = "s", mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
--    { key = "o", mods = "LEADER",       action="TogglePaneZoomState" },
--    { key = "z", mods = "LEADER",       action="TogglePaneZoomState" },
--    { key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
--    { key = "h", mods = "CTRL",       action=wezterm.action{ActivatePaneDirection="Left"}},
--    { key = "j", mods = "CTRL",       action=wezterm.action{ActivatePaneDirection="Down"}},
--    { key = "k", mods = "CTRL",       action=wezterm.action{ActivatePaneDirection="Up"}},
--    { key = "l", mods = "CTRL",       action=wezterm.action{ActivatePaneDirection="Right"}},
--    { key = "H", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
--    { key = "J", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
--    { key = "K", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
--    { key = "L", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
--    { key = "1", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
--    { key = "2", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
--    { key = "3", mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
--    { key = "4", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
--    { key = "5", mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
--    { key = "6", mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
--    { key = "7", mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
--    { key = "8", mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
--    { key = "9", mods = "LEADER",       action=wezterm.action{ActivateTab=8}},
--    { key = "&", mods = "LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
--    { key = "d", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},
--    { key = "x", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},
  }
--config.font = wezterm.font 'JetBrains Mono'
config.font = wezterm.font_with_fallback({
        family = "JetBrains Mono",
        harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
   })
config.harfbuzz_features = { 'zero' }
config.tab_bar_at_bottom = false
config.scrollback_lines = 100000
--config.color_scheme = "nordfox"
--config.color_scheme = "3024 Day"
config.color_scheme = "Dracula"
config.use_fancy_tab_bar = false


-- RIGHT STATUS BAR
wezterm.on('update-right-status', function(window, pane)
  -- Each element holds the text for a cell in a "powerline" style << fade
  local cells = {}

  -- Figure out the cwd and host of the current pane.
  -- This will pick up the hostname for the remote host if your
  -- shell is using OSC 7 on the remote host.
  local cwd_uri = pane:get_current_working_dir()
  if cwd_uri then
    local cwd = ''
    local hostname = ''

    if type(cwd_uri) == 'userdata' then
      -- Running on a newer version of wezterm and we have
      -- a URL object here, making this simple!

      cwd = cwd_uri.file_path
      hostname = cwd_uri.host or wezterm.hostname()
    else
      -- an older version of wezterm, 20230712-072601-f4abf8fd or earlier,
      -- which doesn't have the Url object
      cwd_uri = cwd_uri:sub(8)
      local slash = cwd_uri:find '/'
      if slash then
        hostname = cwd_uri:sub(1, slash - 1)
        -- and extract the cwd from the uri, decoding %-encoding
        cwd = cwd_uri:sub(slash):gsub('%%(%x%x)', function(hex)
          return string.char(tonumber(hex, 16))
        end)
      end
    end

    -- Remove the domain name portion of the hostname
    local dot = hostname:find '[.]'
    if dot then
      hostname = hostname:sub(1, dot - 1)
    end
    if hostname == '' then
      hostname = wezterm.hostname()
    end

    table.insert(cells, cwd)
    table.insert(cells, hostname)
  end

  -- I like my date/time in this style: "Wed Mar 3 08:14"
  local date = wezterm.strftime '%a %b %-d %H:%M'
  table.insert(cells, date)

  -- An entry for each battery (typically 0 or 1 battery)
  for _, b in ipairs(wezterm.battery_info()) do
    table.insert(cells, string.format('%.0f%%', b.state_of_charge * 100))
  end

  -- The powerline < symbol
  local LEFT_ARROW = utf8.char(0xe0b3)
  -- The filled in variant of the < symbol
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

  -- Color palette for the backgrounds of each cell
  local colors = {
    '#3c1361',
    '#52307c',
    '#663a82',
    '#7c5295',
    '#b491c8',
  }

  -- Foreground color for the text across the fade
  local text_fg = '#c0c0c0'

  -- The elements to be formatted
  local elements = {}
  -- How many cells have been formatted
  local num_cells = 0

  -- Translate a cell into elements
  function push(text, is_last)
    local cell_no = num_cells + 1
    table.insert(elements, { Foreground = { Color = text_fg } })
    table.insert(elements, { Background = { Color = colors[cell_no] } })
    table.insert(elements, { Text = ' ' .. text .. ' ' })
    if not is_last then
      table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
      table.insert(elements, { Text = SOLID_LEFT_ARROW })
    end
    num_cells = num_cells + 1
  end

  while #cells > 0 do
    local cell = table.remove(cells, 1)
    push(cell, #cells == 0)
  end

  window:set_right_status(wezterm.format(elements))
end)



-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#0b0022'
    local background = '#1b1032'
    local foreground = '#808080'

    if tab.is_active then
      background = '#2b2042'
      foreground = '#c0c0c0'
    elseif hover then
      background = '#3b3052'
      foreground = '#909090'
    end

    local edge_foreground = background

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)
config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '0.5cell',
  bottom = 0,
}

return config

