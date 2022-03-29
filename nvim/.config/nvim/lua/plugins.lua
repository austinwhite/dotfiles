local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

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

function get_config(name)
  return string.format("require(\"config/%s\")", name)
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require("packer").startup(function(use)

  -- have packer manager itself
  use { "wbthomason/packer.nvim" }

  -- theme
  use {
    "projekt0n/github-nvim-theme",
    config = get_config("github-theme")
  }
  
  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = get_config("treesitter")
  }
  use { "p00f/nvim-ts-rainbow" }

  -- setup configuration if bootstrapped
  if packer_bootstrap then
    require("packer").sync()
  end

end)
