return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("undotree").setup({
      float_diff = true,
      ignore_filetype = {
        "undotree",
        "undotreeDiff",
        "qf",
        "TelescopePrompt",
        "spectre_panel",
        "tsplayground",
      },
      window = {
        winblend = 0,
      },
    })
  end,
  keys = {
    {
      "<leader>u",
      function()
        require("undotree").toggle()
      end,
    },
  },
}
