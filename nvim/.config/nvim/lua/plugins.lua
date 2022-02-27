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
        install_path
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

    -- add symbols to lsp
    use { "onsails/lspkind-nvim" }

    -- completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
        },
        config = function()
            require("config/completion")
        end,
    }

    -- snippets
    use { "L3MON4D3/LuaSnip" }
    use { "rafamadriz/friendly-snippets" }

    if packer_bootstrap then
      require("packer").sync()
    end
end)
