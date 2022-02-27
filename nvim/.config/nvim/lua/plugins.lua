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
    
    -- self managed
    use { "wbthomason/packer.nvim" }

    -- theme
    use {
        "projekt0n/github-nvim-theme",
        require('github-theme').setup()
    }

    -- completion plugin
    use { "hrsh7th/nvim-cmp" } -- completion plugin
    use { "hrsh7th/cmp-buffer" } -- buffer completions
    use { "hrsh7th/cmp-path" } -- path completions
    use { "hrsh7th/cmp-cmdline" } -- cmdline completions

    -- set up full configuration if packer isn't installed
    if packer_bootstrap then
      require("packer").sync()
    end
end)
