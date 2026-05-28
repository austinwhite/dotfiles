return {
  "folke/trouble.nvim",
  opts = {
    modes = {
      diagnostics = {
        win = { position = "right", size = 75 },
      },
      qflist = {
        win = { position = "right", size = 75 },
      },
      loclist = {
        win = { position = "right", size = 75 },
      },
    },
  },
  keys = {
    {
      "<leader>xx",
      function()
        require("trouble").toggle("diagnostics")
      end,
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      function()
        require("trouble").toggle("diagnostics", { filter = { buf = 0 } })
      end,
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      function()
        require("trouble").toggle("symbols", { focus = false })
      end,
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      function()
        require("trouble").toggle("lsp", { focus = false, win = { position = "right", size = 75 } })
      end,
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      function()
        require("trouble").toggle("loclist")
      end,
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      function()
        require("trouble").toggle("qflist")
      end,
      desc = "Quickfix List (Trouble)",
    },
  },
}
