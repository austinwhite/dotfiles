return {
  "echasnovski/mini.files",
  version = false,
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("mini.files").setup({
      windows = {
        preview = true,
        width_preview = 80,
      },
    })
    local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
    vim.api.nvim_set_hl(0, "MiniFilesBorder", { fg = "#535965", bg = normal_bg })
    vim.api.nvim_set_hl(0, "MiniFilesNormal", { bg = normal_bg })
  end,
  keys = {
    {
      "<leader>rw",
      function()
        local utils = require("utils")
        utils.minifiles_toggle()
      end,
    },
  },
}
