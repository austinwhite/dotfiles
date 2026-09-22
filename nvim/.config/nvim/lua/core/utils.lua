local M = {}

M.minifiles_toggle = function(...)
  local MiniFiles = require("mini.files")

  if not MiniFiles.close() then
    MiniFiles.open(...)
  end
end

return M
