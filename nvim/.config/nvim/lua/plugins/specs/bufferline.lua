return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
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
