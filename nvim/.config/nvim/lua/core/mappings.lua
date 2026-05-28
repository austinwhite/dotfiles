vim.g.mapleader = " "

-- buffers
vim.keymap.set("n", "<TAB>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-TAB>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>ba", "<cmd>silent bufdo bd<CR>", { desc = "Delete all buffers" })
vim.keymap.set("n", "<leader>bu", "<cmd>silent %bd|e#|bd#<CR>", { desc = "Delete other buffers" })

-- splits
vim.keymap.set("n", "<Left>", "<cmd>vertical resize +3<CR>", { desc = "Increase split width" })
vim.keymap.set("n", "<Right>", "<cmd>vertical resize -3<CR>", { desc = "Decrease split width" })
vim.keymap.set("n", "<Up>", "<cmd>resize +3<CR>", { desc = "Increase split height" })
vim.keymap.set("n", "<Down>", "<cmd>resize -3<CR>", { desc = "Decrease split height" })

vim.keymap.set("n", "<leader>sh", "<C-w>t<C-w>H", { desc = "Move split to left" })
vim.keymap.set("n", "<leader>sk", "<C-w>t<C-w>K", { desc = "Move split to top" })
