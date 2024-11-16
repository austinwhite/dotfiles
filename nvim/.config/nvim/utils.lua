local M = {}

local MiniFiles = require("mini.files")
local Oil = require("oil")

M.minifiles_toggle = function(...)
  if not MiniFiles.close() then
    MiniFiles.open(...)
  end
end

M.oil_toggle = function(...)
  local curr_buff_ft = vim.bo.filetype

  if curr_buff_ft == "oil" then
    Oil.close()
  else
    Oil.open(...)
  end
end

return M
