local border = {
  { "╭", "NormalFloat" },
  { "─", "NormalFloat" },
  { "╮", "NormalFloat" },
  { "│", "NormalFloat" },
  { "╯", "NormalFloat" },
  { "─", "NormalFloat" },
  { "╰", "NormalFloat" },
  { "│", "NormalFloat" },
}

return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  opts = {
    default_file_explorer = true,
    columns = { "icon" },
    view_options = {
      show_hidden = true,
    },
    confirmation = {
      border = border,
      win_options = {
        winhighlight = "Normal:NormalFloat,FloatBorder:NormalFloat",
      },
    },
  },
  keys = {
    {
      "-",
      function()
        require("oil").open()
      end,
      desc = "Open parent directory",
    },
  },
}
