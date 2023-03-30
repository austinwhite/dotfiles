local opt = vim.opt
local wo = vim.wo
local fn = vim.fn
local api = vim.api
local g = vim.g

-- set colorscheme
api.nvim_cmd({
	cmd = "colorscheme",
	args = { "github_dimmed" },
}, {})

-- tabs are 4 spaces long
opt.tabstop = 4

-- number of spaces to use when inserting a tab
opt.shiftwidth = 4

-- amount of rows for cmd output
opt.cmdheight = 1

-- time to wait for mapped sequence to complete
opt.timeoutlen = 325

-- faster completion (4000ms default)
opt.updatetime = 300

-- number of spaces to use for indenting
opt.softtabstop = 4

-- expand tabs into spaces
opt.expandtab = true

-- case-insesative search unless capital letter is used
opt.smartcase = true

-- indents based on the code syntax you're editing
opt.smartindent = true

-- copy indent from previous line
opt.autoindent = true

-- use relative line numbering
opt.relativenumber = true

-- use absolute line number for current line
opt.number = true

-- search highlighting is not persistent
opt.hlsearch = false

-- incremental search
opt.incsearch = true

-- no error bells
opt.errorbells = false

-- don't wrap lines
opt.wrap = false

-- unsaved buffers are hidden
opt.hidden = true

-- don't create swap files
opt.swapfile = false

-- keep 8 rows visible while scrolling
opt.scrolloff = 8

-- keep 5 columns visible while side scrolling
opt.sidescrolloff = 5

-- store unfo info in a file
opt.undofile = true

-- where to store undo file
opt.undodir = fn.stdpath("config") .. "/undo"

-- true color
opt.termguicolors = true

-- number column width
opt.numberwidth = 5

-- force all horizontal splits to go below current windows
opt.splitbelow = true

-- force all vertical splits to go to the right of current window
opt.splitright = true

-- hide mode from cmdoutput areaa
opt.showmode = false

-- highlight line where cursor is
wo.cursorline = true

-- show sign column at all times
wo.signcolumn = "yes"

-- hide welcome message
opt.shortmess = "I"

-- hide netrw banner
g.netrw_banner = 0

-- color column
api.nvim_set_option_value("colorcolumn", "80", {})
