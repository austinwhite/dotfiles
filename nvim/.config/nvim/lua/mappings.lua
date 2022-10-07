local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- set leader to space key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- buffers
keymap("n", "<TAB>", "<cmd>:bnext<CR>", opts)
keymap("n", "<S-TAB>", "<cmd>:bprevious<CR>", opts)
keymap("n", "<leader>bd", "<cmd>:bd<CR>", opts)

-- resizing panes
keymap("n", "<Left>", ":vertical resize +1<CR>", opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", opts)
keymap("n", "<Up>", ":resize -1<CR>", opts)
keymap("n", "<Down>", ":resize +1<CR>", opts)

-- telescope pickers
local builtin = require('telescope.builtin')
local extensions = require('telescope').extensions
keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fg', builtin.live_grep, {})
keymap('n', '<leader>fb', builtin.buffers, {})
keymap('n', '<leader>fh', builtin.help_tags, {})
keymap('n', '<leader>ft', extensions.file_browser.file_browser, {})

-- git fugitive
keymap('n', '<leader>gs', '<cmd>Git<cr>', { desc = 'Git status' })
keymap('n', '<leader>gw', '<cmd>Gwrite<cr>', { desc = 'Git add' })
keymap('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = 'Git commit' })
keymap('n', '<leader>gd', '<cmd>Gdiffsplit<cr>', { desc = 'Git diff' })
keymap('n', '<leader>gpl', '<cmd>Git pull<cr>', { desc = 'Git pull' })
keymap('n', '<leader>gpu', '<cmd>15 split|term git push<cr>', { desc = 'Git push' })
