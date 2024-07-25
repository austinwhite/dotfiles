local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
  return
end

lsp.preset("recommended")

lsp.ensure_installed({})

-- fix undefined 'vim'
lsp.configure("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"}
      }
    }
  }
})

local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

local cmp_select = {
  behavior = cmp.SelectBehavior.Select
}

local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<CR>"] = cmp.mapping.confirm({
    select = true
  }),
  ["<C-Space>"] = cmp.mapping.complete()
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_sign_icons({
  error = "✘",
  warn = "▲",
  hint = "⚑",
  info = "»"
})

require("luasnip.loaders.from_vscode").lazy_load()

local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    },
    border = "rounded"
  }
})

-- add a border to lspconfig window
local status_ok, lspwin = pcall(require, "lspconfig.ui.windows")
if not status_ok then
  return
end

lspwin.default_options.border = "rounded"

lsp.setup()

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {formatting.prettier, formatting.stylua, formatting.clang_format, formatting.cmake_format,
             formatting.black}
})

vim.keymap.set("n", "<leader>I", function()
  vim.lsp.buf.format()
end, {})
