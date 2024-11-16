return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>-",
      function()
        local utils = require("utils")
        utils.oil_toggle()
      end,
    },
  },
}
