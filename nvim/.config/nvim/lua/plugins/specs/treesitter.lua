return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master", -- legacy API; main no longer provides nvim-treesitter.configs
  lazy = false, -- does not support lazy loading
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      modules = {},
      ignore_install = {},
      ensure_installed = {},
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
