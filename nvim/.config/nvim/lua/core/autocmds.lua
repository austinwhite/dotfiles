local augroup = vim.api.nvim_create_augroup("UserAutoCommands", { clear = true })

local function apply_float_highlights()
  local normal_float = vim.api.nvim_get_hl(0, { name = "NormalFloat" })

  for _, group in ipairs({
    "TelescopeNormal",
    "TelescopeBorder",
    "TelescopePromptNormal",
    "TelescopePromptBorder",
    "TelescopeResultsNormal",
    "TelescopeResultsBorder",
    "TelescopePreviewNormal",
    "TelescopePreviewBorder",
    "MiniFilesBorder",
    "MiniFilesBorderModified",
    "MiniFilesNormal",
  }) do
    vim.api.nvim_set_hl(0, group, { fg = normal_float.fg, bg = normal_float.bg })
  end
end

apply_float_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  group = augroup,
  desc = "Keep floating UI highlights consistent",
  callback = apply_float_highlights,
})

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

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  desc = "Enable spell checking for prose-like files",
  pattern = { "gitcommit", "markdown", "text" },
  callback = function()
    vim.opt_local.spell = true
  end,
})
