return {
  "m4xshen/smartcolumn.nvim",
  opts = {},
  config = function()
    require("smartcolumn").setup({
      disabled_filetypes = { "ministarter" },
    })
  end,
}
