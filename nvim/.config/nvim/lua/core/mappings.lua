vim.g.mapleader = " "

-- buffers
vim.keymap.set("n", "<TAB>", "<cmd>:bnext<CR>", {})
vim.keymap.set("n", "<S-TAB>", "<cmd>:bprevious<CR>", {})
vim.keymap.set("n", "<leader>bd", "<cmd>:bd<CR>", {})

-- splits
vim.keymap.set("n", "<Left>", ":vertical resize +3<CR>", {}) -- vertical resize
vim.keymap.set("n", "<Right>", ":vertical resize -3<CR>", {}) -- vertical resize
vim.keymap.set("n", "<Up>", ":resize +3<CR>", {}) -- horizontal resize
vim.keymap.set("n", "<Down>", ":resize -3<CR>", {}) -- horizontal resize

vim.keymap.set("n", "<leader>sh", "<C-w>t<C-w>H", {}) -- swap horizontal -> vertical
vim.keymap.set("n", "<leader>sk", "<C-w>t<C-w>K", {}) -- swap vertical -> horizontal
