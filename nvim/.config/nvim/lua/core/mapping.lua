local keymap = vim.keymap.set
local g = vim.g

g.mapleader = " "

-- buffers
keymap("n", "<leader>bn", "<cmd>:bnext<CR>", {})
keymap("n", "<leader>bp", "<cmd>:bprevious<CR>", {})
keymap("n", "<leader>bd", "<cmd>:bd<CR>", {})

-- split management
keymap("n", "<leader>sv", "<C-w>v", {}) -- new vertical
keymap("n", "<leader>ss", "<C-w>s", {}) -- new horizontal
keymap("n", "<leader>sq", "<C-w>q", {}) -- quit current

keymap("n", "<C-h>", "<C-w>h", {}) -- move left
keymap("n", "<C-j>", "<C-w>j", {}) -- move down
keymap("n", "<C-k>", "<C-w>k", {}) -- move up
keymap("n", "<C-l>", "<C-w>l", {}) -- move right

keymap("n", "<Left>", ":vertical resize +3<CR>", {}) -- vertical resize
keymap("n", "<Right>", ":vertical resize -3<CR>", {}) -- vertical resize
keymap("n", "<Up>", ":resize +3<CR>", {}) -- horizontal resize
keymap("n", "<Down>", ":resize -3<CR>", {}) -- horizontal resize

keymap("n", "<leader>sh", "<C-w>t<C-w>H", {}) -- swap horizontal --> vertical
keymap("n", "<leader>sk", "<C-w>t<C-w>K", {}) -- swap vertical --> horizontal
