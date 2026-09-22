return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
    "saghen/blink.cmp",
  },
  ft = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  opts = function()
    return {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
      settings = {
        expose_as_code_action = "all",
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    }
  end,
  keys = {
    { "<leader>co", "<cmd>TSToolsOrganizeImports<cr>", ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" }, desc = "Organize imports" },
    { "<leader>cA", "<cmd>TSToolsAddMissingImports<cr>", ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" }, desc = "Add missing imports" },
    { "<leader>cR", "<cmd>TSToolsRenameFile<cr>", ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" }, desc = "Rename file" },
  },
}
