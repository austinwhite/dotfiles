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

-- open packer displays as a floating window 
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
    run = ":TSUpdate",
    requires = {
      { "p00f/nvim-ts-rainbow" },
    },
    config = get_config("treesitter"),
  }

  -- setup configuration if packer was bootstrapped
  if packer_bootstrap then
    require("packer").sync()
  end

end)
