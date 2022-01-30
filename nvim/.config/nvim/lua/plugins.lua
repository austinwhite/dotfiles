local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 
        'clone', 
        '--depth', 
        '1', 
        'https://github.com/wbthomason/packer.nvim', 
        install_path
    })
end

return require('packer').startup(function(use)
    
    use {'wbthomason/packer.nvim'}

    use {
        "projekt0n/github-nvim-theme",
        require('github-theme').setup()
    }

    if packer_bootstrap then
      require('packer').sync()
    end
end)
