return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mason-org/mason.nvim",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    require("mason").setup({
      ui = {
        border = {
          { "╭", "NormalFloat" },
          { "─", "NormalFloat" },
          { "╮", "NormalFloat" },
          { "│", "NormalFloat" },
          { "╯", "NormalFloat" },
          { "─", "NormalFloat" },
          { "╰", "NormalFloat" },
          { "│", "NormalFloat" },
        },
      },
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    require("mason-lspconfig").setup({
      automatic_enable = true,
      ensure_installed = {},
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({ capabilities = capabilities })
        end,
      },
    })

    vim.opt.signcolumn = "yes"

    local signs = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
      [vim.diagnostic.severity.INFO] = " ",
    }

    vim.diagnostic.config({
      underline = false,
      virtual_text = true,
      signs = { text = signs },
    })
  end,
}
