local opt = vim.opt
local wo = vim.wo
local fn = vim.fn

opt.tabstop = 4                                     -- tabs are 4 spaces long
opt.shiftwidth = 4                                  -- number of spaces to use when inserting a tab
opt.cmdheight = 1                                   -- amount of rows for cmd output
opt.timeoutlen = 200                                -- time to wait for mapped sequence to complete
opt.updatetime = 300                                -- faster completion (4000ms default)
opt.softtabstop = 4                                 -- number of spaces to use for indenting
opt.expandtab = true                                -- expand tabs into spaces
opt.smartcase = true                                -- case-insesative search unless capital letter is used
opt.smartindent = true                              -- indents based on the code syntax you're editing
opt.number = true                                   -- show line numbers
opt.autoindent = true                               -- copy indent from previous line
opt.relativenumber = true                           -- use relative line numbering
opt.hlsearch = false                                -- search highlighting is not persistent
opt.incsearch = true                                -- incremental search
opt.errorbells = false                              -- no error bells
opt.wrap = false                                    -- don't wrap lines
opt.hidden = true                                   -- unsaved buffers are hidden
opt.swapfile = false                                -- don't create swap files
opt.scrolloff = 8                                   -- keep 8 rows visible while scrolling
opt.sidescrolloff = 5                               -- keep 5 columns visible while side scrolling
opt.undofile = true                                 -- store unfo info in a file
opt.undodir = fn.stdpath('config')..'/undo'         -- where to store undo fileh
opt.termguicolors = true                            -- true color
opt.numberwidth = 4                                 -- number column width
opt.splitbelow = true                               -- force all horizontal splits to go below current windows
opt.splitright = true                               -- force all vertical splits to go to the right of current window
opt.showmode = false                                -- hide mode from cmdoutput areaa
wo.colorcolumn = "80"                               -- highlight the 80th column
wo.cursorline = true                                -- highlight line where cursor is
wo.signcolumn = "yes"                               -- show sugn column at all times
