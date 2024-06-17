local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvimtree.setup()

vim.keymap.set("n", "<leader>rw", "<cmd>:NvimTreeToggle<CR>", {})
