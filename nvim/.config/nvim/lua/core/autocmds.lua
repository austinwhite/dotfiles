local augroup = vim.api.nvim_create_augroup("UserAutoCommands", { clear = true })

-- flash highlight text on yank
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

local function close_sidebar_windows()
  local tree_wins = {}
  local floating_wins = {}
  local sidebar_filetypes = {
    ["NvimTree_"] = true,
    ["undotree"] = true,
    ["diff"] = true,
  }

  local wins = vim.api.nvim_list_wins()
  for _, w in ipairs(wins) do
    local bufnr = vim.api.nvim_win_get_buf(w)
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

    if sidebar_filetypes[filetype] or bufname:match("NvimTree_") ~= nil then
      table.insert(tree_wins, w)
    end
    if vim.api.nvim_win_get_config(w).relative ~= "" then
      table.insert(floating_wins, w)
    end
  end

  if 1 == #wins - #floating_wins - #tree_wins then
    for _, w in ipairs(tree_wins) do
      vim.api.nvim_win_close(w, true)
    end
  end
end

vim.api.nvim_create_autocmd("QuitPre", {
  group = augroup,
  callback = close_sidebar_windows,
})
