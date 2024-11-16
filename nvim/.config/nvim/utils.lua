local M = {}

M.minifiles_toggle = function(...)
  local MiniFiles = require("mini.files")

  if not MiniFiles.close() then
    MiniFiles.open(...)
  end
end

M.oil_toggle = function(...)
  local Oil = require("oil")
  local curr_buff_ft = vim.bo.filetype

  if curr_buff_ft == "oil" then
    Oil.close()
  else
    Oil.open(...)
  end
end

return M
