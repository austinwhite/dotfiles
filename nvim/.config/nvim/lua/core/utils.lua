local M = {}
local backdrops = {}

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
  return win
end

M.close_backdrop = function(name)
  local win = backdrops[name]
  if win and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_win_close(win, true)
  end
  backdrops[name] = nil
end

M.minifiles_toggle = function(...)
  local MiniFiles = require("mini.files")

  if not MiniFiles.close() then
    MiniFiles.open(...)
  end
end

return M
