return {
  "echasnovski/mini.starter",
  version = false,
  config = function()
    require("mini.starter").setup({
      footer = "Heavy heart, glass eyes.\nBindle over my shoulder.\nOn to the next one.",
    })
    local footer_fg = vim.api.nvim_get_hl(0, { name = "NonText" }).fg
    vim.api.nvim_set_hl(0, "MiniStarterHeader", { link = "MoreMsg" })
    vim.api.nvim_set_hl(0, "MiniStarterFooter", { fg = footer_fg })
  end,
}
