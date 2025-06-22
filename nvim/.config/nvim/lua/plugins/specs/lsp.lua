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
    require("mason").setup()

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

    vim.diagnostic.config({
      underline = false,
      virtual_text = true,
    })

    if vim.g.have_nerd_font then
      local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end
  end,
}
