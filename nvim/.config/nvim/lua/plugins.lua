local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

-- bootstrap packer if not found
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

-- dont continue if packer isn't installed and bootstrapping failed
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- open packer displays as floating windows
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- get require statement for a given config
function get_config(name)
  return string.format("require(\"config/%s\")", name)
end

-- plugins
return require("packer").startup(function(use)

  -- have packer manager itself
  use { "wbthomason/packer.nvim" }

  -- theme
  use {
    "projekt0n/github-nvim-theme",
    config = get_config("github-theme"),
  }

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    config = get_config("treesitter"),
    run = ":TSUpdate",
    requires = { { "p00f/nvim-ts-rainbow" } },
  }

  -- autoclose brackets and quotes
  use {
    "windwp/nvim-autopairs",
    config = get_config("autopairs"),
  }

  -- completion
  use {
    "hrsh7th/nvim-cmp",
    config = get_config("completion"),
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "saadparwaiz1/cmp_luasnip" },
    },
  }

  -- snippets
  use { "L3MON4D3/LuaSnip" }
  use {
    "rafamadriz/friendly-snippets",
    requires = { { "3MON4D3/LuaSnip" } },
  }

  -- lsp
  use {
    "neovim/nvim-lspconfig",
    requires = { { "williamboman/nvim-lsp-installer" } },
    config = get_config("lsp"),
  }

  -- telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-lua/popup.nvim" },
        { "nvim-telescope/telescope-media-files.nvim" },
        { "nvim-telescope/telescope-file-browser.nvim" },
    },
    config = get_config("telescope"),
  }

  -- terminal
  use {
    "akinsho/toggleterm.nvim",
    config = get_config("toggleterm"),
  }

  -- status line
  use {
    "nvim-lualine/lualine.nvim",
    config = get_config("lualine"),
  }

  -- run configuration if packer was bootstrapped
  if packer_bootstrap then
    require("packer").sync()
  end

end)
