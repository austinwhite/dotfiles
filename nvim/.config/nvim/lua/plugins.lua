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

function get_config(name)
  return string.format("require(\"config/%s\")", name)
end

return require("packer").startup(function(use)

  -- have packer manager itself
  use { "wbthomason/packer.nvim", opt = true }

  -- theme
  use {
    "projekt0n/github-nvim-theme",
    config = get_config("github-theme")
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = get_config("treesitter")
  }

  use { "p00f/nvim-ts-rainbow" }

  if packer_bootstrap then
    require("packer").sync()
  end

end)
