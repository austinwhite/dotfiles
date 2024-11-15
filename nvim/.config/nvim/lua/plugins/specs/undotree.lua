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
        "ministarter",
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
        local current_ft = vim.bo.filetype

        local ignored_filetypes = {
          "undotreeDiff",
          "qf",
          "TelescopePrompt",
          "spectre_panel",
          "tsplayground",
          "ministarter",
        }

        for _, ft in ipairs(ignored_filetypes) do
          if current_ft == ft then
            vim.notify("Cannot open undotree in " .. current_ft .. " buffer", vim.log.levels.WARN, {
              title = "Undotree",
              icon = "󰋗",
              timeout = 2000,
            })
            return
          end
        end

        require("undotree").toggle()
      end,
    },
  },
}
