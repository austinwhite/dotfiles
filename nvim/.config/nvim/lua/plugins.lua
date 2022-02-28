local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

-- bootstrap packer if not isntalled
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

return require("packer").startup(function(use)

    -- package manager
    use { "wbthomason/packer.nvim", opt = true }

    -- theme
    use {
        "projekt0n/github-nvim-theme",
        config = function()
            require("config/github-theme")
        end,
    }

    -- completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lsp" },
        },
        config = function()
            require("config/completion")
        end,
    }

    -- lsp
    use {
        "neovim/nvim-lspconfig",
        "williamboman/nvim-lsp-installer",
        config = function()
            require("config/lsp")
        end,
    }
    use { "onsails/lspkind-nvim" }

    -- snippets
    use { "L3MON4D3/LuaSnip" }
    use { "rafamadriz/friendly-snippets" }

    if packer_bootstrap then
      require("packer").sync()
    end
end)
