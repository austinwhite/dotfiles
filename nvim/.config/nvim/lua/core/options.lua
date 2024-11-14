-- disable netrw for alternative
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- tabs are 4 spaces long
vim.opt.tabstop = 2

-- number of spaces to use when inserting a tab
vim.opt.shiftwidth = 2

-- amount of rows for cmd output
vim.opt.cmdheight = 1

-- time to wait for mapped sequence to complete
vim.opt.timeoutlen = 325

-- faster completion (4000ms default)
vim.opt.updatetime = 300

-- number of spaces to use for indenting
vim.opt.softtabstop = 4

-- expand tabs into spaces
vim.opt.expandtab = true

-- case-insesative search unless capital letter is used
vim.opt.smartcase = true

-- indents based on the code syntax you're editing
vim.opt.smartindent = true

-- copy indent from previous line
vim.opt.autoindent = true

-- use relative line numbering
vim.opt.relativenumber = true

-- use absolute line number for current line
vim.opt.number = true

-- search highlighting is not persistent
vim.opt.hlsearch = false

-- incremental search
vim.opt.incsearch = true

-- no error bells
vim.opt.errorbells = false

-- don't wrap lines
vim.opt.wrap = false

-- unsaved buffers are hidden
vim.opt.hidden = true

-- don't create swap files
vim.opt.swapfile = false

-- keep 8 rows visible while scrolling
vim.opt.scrolloff = 8

-- keep 5 columns visible while side scrolling
vim.opt.sidescrolloff = 5

-- store unfo info in a file
vim.opt.undofile = true

-- where to store undo file
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"

-- true color
vim.opt.termguicolors = true

-- number column width
vim.opt.numberwidth = 5

-- force all horizontal splits to go below current windows
vim.opt.splitbelow = true

-- force all vertical splits to go to the right of current window
vim.opt.splitright = true

-- hide mode from cmdoutput areaa
vim.opt.showmode = false

-- highlight line where cursor is
vim.wo.cursorline = true

-- show sign column at all times
vim.wo.signcolumn = "yes"

-- hide welcome message
vim.opt.shortmess = "I"

-- hide netrw banner
vim.g.netrw_banner = 0
