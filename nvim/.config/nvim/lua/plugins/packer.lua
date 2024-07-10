local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use({"wbthomason/packer.nvim"})

  use({
    "projekt0n/github-nvim-theme",
    tag = "v0.0.7"
  })

  use {'shaunsingh/nord.nvim'}

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    requires = {{"nvim-lua/plenary.nvim"},

    -- extensions
    {"nvim-telescope/telescope-file-browser.nvim"}}
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  })

  use({"nvim-tree/nvim-tree.lua"})

  use({"christoomey/vim-tmux-navigator"})

  use({"nvim-treesitter/playground"})

  use({"mbbill/undotree"})

  use({"tpope/vim-fugitive"})

  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = { 
    -- lsp Support
    {"neovim/nvim-lspconfig"},
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},

    -- autocompletion
    {"hrsh7th/nvim-cmp"},
    {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-path"},
    {"saadparwaiz1/cmp_luasnip"},
    {"hrsh7th/cmp-nvim-lua"},

    -- snippets
    {"L3MON4D3/LuaSnip"},
    {"rafamadriz/friendly-snippets"},

    -- dap and lsp support
    {"jose-elias-alvarez/null-ls.nvim"}}
  })

  use({
    "nvim-lualine/lualine.nvim",
    requires = "nvim-tree/nvim-web-devicons"
  })

  use({"windwp/nvim-autopairs"})

  use({"folke/trouble.nvim"})

  use({"lukas-reineke/virt-column.nvim"})

  use({"goolord/alpha-nvim"})

  if packer_bootstrap then
    require('packer').sync()
  end
end)
