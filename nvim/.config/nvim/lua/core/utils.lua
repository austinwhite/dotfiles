local M = {}
local backdrops = {}

local function color_to_number(color)
  if type(color) == "number" then
    return color
  end

  if type(color) == "string" then
    return tonumber(color:gsub("#", ""), 16)
  end
end

local function blend(fg, bg, alpha)
  local function channel(value, shift)
    return math.floor(value / shift) % 256
  end

  local r = math.floor(channel(fg, 0x10000) * alpha + channel(bg, 0x10000) * (1 - alpha) + 0.5)
  local g = math.floor(channel(fg, 0x100) * alpha + channel(bg, 0x100) * (1 - alpha) + 0.5)
  local b = math.floor(channel(fg, 0x1) * alpha + channel(bg, 0x1) * (1 - alpha) + 0.5)

  return string.format("#%02x%02x%02x", r, g, b)
end

local function write_terminal_sequence(seq)
  if vim.v.stderr then
    local ok = pcall(vim.api.nvim_chan_send, vim.v.stderr, seq)
    if ok then
      return
    end
  end

  local tty = io.open("/dev/tty", "w")
  if tty then
    tty:write(seq)
    tty:flush()
    tty:close()
  end
end

local function set_ghostty_background(color)
  if vim.env.TMUX then
    write_terminal_sequence(string.format("\027Ptmux;\027\027]11;%s\007\027\\", color))
  else
    write_terminal_sequence(string.format("\027]11;%s\007", color))
  end
end

local function reset_ghostty_background()
  if vim.env.TMUX then
    write_terminal_sequence("\027Ptmux;\027\027]111\007\027\\")
  else
    write_terminal_sequence("\027]111\007")
  end
end

local function backdrop_color(opts)
  local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
  local normal_bg = normal.bg or 0x000000
  local backdrop_bg = color_to_number(opts.bg) or 0x000000
  local opacity = 1 - ((opts.winblend or 55) / 100)

  return blend(backdrop_bg, normal_bg, opacity)
end

local function has_active_backdrops()
  for name, win in pairs(backdrops) do
    if vim.api.nvim_win_is_valid(win) then
      return true
    end
    backdrops[name] = nil
  end

  return false
end

M.open_backdrop = function(name, opts)
  opts = opts or {}

  if backdrops[name] and vim.api.nvim_win_is_valid(backdrops[name]) then
    return backdrops[name]
  end

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    row = 0,
    col = 0,
    width = vim.o.columns,
    height = vim.o.lines,
    focusable = false,
    style = "minimal",
    border = "none",
    zindex = opts.zindex or 1,
  })

  local hl = opts.hl or "DimBackdrop"
  vim.api.nvim_set_hl(0, hl, { bg = opts.bg or "#000000" })
  vim.wo[win].winhighlight = "Normal:" .. hl
  vim.wo[win].winblend = opts.winblend or 55

  backdrops[name] = win
  set_ghostty_background(backdrop_color(opts))
  return win
end

M.close_backdrop = function(name)
  local win = backdrops[name]
  if win and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_win_close(win, true)
  end
  backdrops[name] = nil

  if not has_active_backdrops() then
    reset_ghostty_background()
  end
end

M.reset_ghostty_background = reset_ghostty_background

M.minifiles_toggle = function(...)
  local MiniFiles = require("mini.files")

  if not MiniFiles.close() then
    MiniFiles.open(...)
  end
end

return M
