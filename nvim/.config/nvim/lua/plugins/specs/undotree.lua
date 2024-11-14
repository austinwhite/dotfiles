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
        -- local nvim_tree_api = require("nvim-tree.api").tree
        --
        -- if nvim_tree_api.is_visible({ opts = { tabpage = vim.api.nvim_get_current_tabpage() } }) then
        --   nvim_tree_api.close()
        -- end

        require("undotree").toggle()
      end,
    },
  },
}
