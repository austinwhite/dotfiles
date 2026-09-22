return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mason-org/mason.nvim",
    "saghen/blink.cmp",
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

    local border = {
      { "╭", "NormalFloat" },
      { "─", "NormalFloat" },
      { "╮", "NormalFloat" },
      { "│", "NormalFloat" },
      { "╯", "NormalFloat" },
      { "─", "NormalFloat" },
      { "╰", "NormalFloat" },
      { "│", "NormalFloat" },
    }

    local hover = vim.lsp.handlers.hover
    vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
      config = vim.tbl_deep_extend("force", config or {}, { border = border })
      return hover(err, result, ctx, config)
    end

    local signature_help = vim.lsp.handlers.signature_help
    vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
      config = vim.tbl_deep_extend("force", config or {}, { border = border })
      return signature_help(err, result, ctx, config)
    end

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    require("mason-lspconfig").setup({
      automatic_enable = {
        -- rustaceanvim and typescript-tools manage these LSPs.
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

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local map = function(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
        end

        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gr", vim.lsp.buf.references, "Go to references")
        map("K", function()
          vim.lsp.buf.hover({ border = border })
        end, "Hover documentation")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("<leader>cr", vim.lsp.buf.rename, "Rename symbol")
      end,
    })

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
