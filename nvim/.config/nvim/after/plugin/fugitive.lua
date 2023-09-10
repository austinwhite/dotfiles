local status_ok, _ = pcall(require, "fugitve")
if not status_ok then
  return
end

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
