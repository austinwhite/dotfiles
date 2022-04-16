local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'nord',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        separator = { left = '', right = '' }
      }
    },
    lualine_b = { 'branch' },
    lualine_c = {
      {
        'buffers',
        buffers_color = {
          active = '2E3440',
          inactive = { fg = '8D97A8' },
        },
      }
    },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
      },
      'encoding',
      'fileformat',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

