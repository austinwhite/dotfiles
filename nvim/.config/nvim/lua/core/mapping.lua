local keymap = vim.keymap.set
local g = vim.g

g.mapleader = " "

-- buffers
keymap("n", "<TAB>", "<cmd>:bnext<CR>", {})
keymap("n", "<S-TAB>", "<cmd>:bprevious<CR>", {})
keymap("n", "<leader>bd", "<cmd>:bd<CR>", {})

-- splits 
keymap("n", "<Left>", ":vertical resize +3<CR>", {}) -- vertical resize
keymap("n", "<Right>", ":vertical resize -3<CR>", {}) -- vertical resize
keymap("n", "<Up>", ":resize +3<CR>", {}) -- horizontal resize
keymap("n", "<Down>", ":resize -3<CR>", {}) -- horizontal resize

keymap("n", "<leader>sh", "<C-w>t<C-w>H", {}) -- swap horizontal -> vertical
keymap("n", "<leader>sk", "<C-w>t<C-w>K", {}) -- swap vertical -> horizontal
