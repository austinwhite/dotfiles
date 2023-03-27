local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- bootstrap packer if not found
if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
end

-- dont continue if packer isn't installed and bootstrapping failed
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- open packer displays as floating windows
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
}
-- get require statement for a given config
local function get_config(name)
  return string.format('require(\'config/%s\')', name)
end

-- plugins
return require('packer').startup(function(use)

  -- have packer manager itself
  use { 'wbthomason/packer.nvim' }

  -- theme
  use {
    'projekt0n/github-nvim-theme',
    config = get_config('colorschemes/github'),
  }

  -- speed up loading times
  use { 'lewis6991/impatient.nvim' }

  -- better syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    config = get_config('treesitter'),
    run = ':TSUpdate',
  }

  -- fuzzy finder (telescope)
  use {
    'nvim-telescope/telescope.nvim',
    config = get_config('telescope'),
    requires = {
      { 'nvim-lua/plenary.nvim' },

      -- extensions
      { 'nvim-telescope/telescope-file-browser.nvim' }
    },
  }

  -- lsp 
  use {
    'VonHeikemen/lsp-zero.nvim',
    config = get_config('lsp'),
    requires = {
      -- lsp support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- snippets
      { 'L3MON4D3/LuaSnip' },
    },
  }

  -- auto close brackets and quotes
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    config = get_config('lualine'),
    after = 'github-nvim-theme',
  }

  -- buffer managerment
  use {
    'kdheepak/tabline.nvim',
    config = get_config('tabline'),
    after = 'github-nvim-theme',
  }

  -- show git changes in sign column
  use {
    'lewis6991/gitsigns.nvim',
    config = get_config('gitsigns'),
    after = 'github-nvim-theme',
  }

  -- git commands inside nvim
  use { 'tpope/vim-fugitive' }

  -- startup page
  use {
    'goolord/alpha-nvim',
    config = get_config('alpha'),
  }

  -- run configuration if packer was bootstrapped
  if PackerBootstrap then
    require('packer').sync()
  end

end)
