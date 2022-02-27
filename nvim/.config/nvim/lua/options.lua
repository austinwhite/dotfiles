local opt = vim.opt
local wo = vim.wo
local fn = vim.fn

opt.tabstop = 4                                     -- tabs are 4 spaces long
opt.shiftwidth = 4                                  -- number of spaces to use when inserting a tab
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
wo.colorcolumn = "80"                               -- highlight the 80th column
wo.cursorline = true                                -- highlight line where cursor is
opt.undofile = true                                 -- store unfo info in a file
opt.undodir = fn.stdpath('config')..'/undo'         -- where to store undo fileh