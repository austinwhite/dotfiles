local augroup = vim.api.nvim_create_augroup("UserAutoCommands", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  desc = "Highlight yanked text",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 200,
      priority = 250,
      on_macro = true,
      on_visual = true,
      operator = nil,
    })
  end,
})
