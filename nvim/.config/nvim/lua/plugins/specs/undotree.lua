return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("undotree").setup({
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
