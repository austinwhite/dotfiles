local keymap = vim.keymap.set
local g = vim.g

g.mapleader = " "

-- buffers
keymap("n", "<leader>bn", "<cmd>:bnext<CR>", {})
keymap("n", "<leader>bp", "<cmd>:bprevious<CR>", {})
keymap("n", "<leader>bd", "<cmd>:bd<CR>", {})

-- split management
keymap("n", "<leader>sv", "<C-w>v", opts) -- new vertical
keymap("n", "<leader>ss", "<C-w>s", opts) -- new horizontal
keymap("n", "<leader>sq", "<C-w>q", opts) -- quit current

keymap("n", "<C-h>", "<C-w>h", opts) -- move left
keymap("n", "<C-j>", "<C-w>j", opts) -- move down
keymap("n", "<C-k>", "<C-w>k", opts) -- move up
keymap("n", "<C-l>", "<C-w>l", opts) -- move right

keymap("n", "<Left>", ":vertical resize +3<CR>", opts) -- vertical resize
keymap("n", "<Right>", ":vertical resize -3<CR>", opts) -- vertical resize
keymap("n", "<Up>", ":resize +3<CR>", opts) -- horizontal resize
keymap("n", "<Down>", ":resize -3<CR>", opts) -- horizontal resize

keymap("n", "<leader>sh", "<C-w>t<C-w>H", opts) -- swap horizontal --> vertical
keymap("n", "<leader>sk", "<C-w>t<C-w>K", opts) -- swap vertical --> horizontal
