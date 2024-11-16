return {
  "echasnovski/mini.files",
  version = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("mini.files").setup()
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
