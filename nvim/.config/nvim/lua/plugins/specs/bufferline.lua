return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        offsets = {
          {
            filetype = "undotree",
            text = "Undo Tree",
            text_align = "center",
            separator = true,
          },
        },
      },
    })
  end,
}
