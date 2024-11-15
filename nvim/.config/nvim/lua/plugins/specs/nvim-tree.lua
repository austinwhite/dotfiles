return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({})
  end,
  keys = {
    {
      "<leader>rw",
      function()
        local utils = require("utils")
        utils.smartToggle()
      end,
    },
  },
}
