local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
  return
end

vim.api.nvim_set_hl(0, "FloatBorder", {bg="#3B4252", fg="#8FBCBB"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg="#3B4252"})
vim.api.nvim_set_hl(0, "TelescopeNormal", {bg="#3B4252"})
vim.api.nvim_set_hl(0, "TelescopeBorder", {bg="#3B4252"})

nightfox.setup({
  options = {
    dim_inactive = true,
    styles = {
      comments = "italic",
    }
  }
})

vim.cmd("colorscheme nordfox")
