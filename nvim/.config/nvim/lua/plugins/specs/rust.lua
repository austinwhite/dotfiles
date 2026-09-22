return {
  "mrcjkb/rustaceanvim",
  version = "^6",
  ft = { "rust" },
  init = function()
    vim.g.rustaceanvim = {
      server = {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            check = {
              command = "clippy",
            },
          },
        },
      },
    }
  end,
  keys = {
    { "<leader>ca", function() vim.cmd.RustLsp("codeAction") end, ft = "rust", desc = "Rust code action" },
    { "<leader>dr", function() vim.cmd.RustLsp("debuggables") end, ft = "rust", desc = "Rust debuggables" },
  },
}
