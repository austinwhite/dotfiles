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
        backdrop = 100,
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
      automatic_enable = {
        -- rustaceanvim and typscript_tools manage these lsp's
        exclude = { "rust_analyzer", "ts_ls" },
      },
      ensure_installed = {
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "ts_ls",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({ capabilities = capabilities })
        end,
      },
    })

    local signs = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
      [vim.diagnostic.severity.INFO] = " ",
    }

    vim.diagnostic.config({
      underline = false,
      virtual_text = true,
      update_in_insert = true,
      severity_sort = true,
      signs = {
        text = signs,
        priority = 100,
      },
    })
  end,
}
