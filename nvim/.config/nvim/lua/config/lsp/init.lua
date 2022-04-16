local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("config.lsp.lsp-installer")
require("config.lsp.handlers").setup()

local win = require('lspconfig.ui.windows')
local _default_opts = win.default_opts

win.default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = 'rounded'
  return opts
end
