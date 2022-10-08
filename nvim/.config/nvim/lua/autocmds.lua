local cmd = vim.cmd

-- terminal
--   dont use line numbers
--   start in insert mode
cmd [[
  augroup term_settings
    autocmd!
    autocmd TermOpen * setlocal norelativenumber nonumber
    autocmd TermOpen * startinsert
  augroup END
]]
