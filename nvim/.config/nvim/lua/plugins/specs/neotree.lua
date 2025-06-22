return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false, -- lazy loads itself
  config = function()
    require("neo-tree").setup({
      filesystem = {
        hijack_netrw_behavior = "disabled",
      },
    })
  end,
}
