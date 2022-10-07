local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

treesitter.setup({
  ensure_installed = { 
    'python', 'c', 'cpp', 'lua', 'javascript', 'typescript',
  },
  ignore_install = {},
  auto_install = true,
  highlight = {
    enable = true,
    disable = { '' },
  },
})
