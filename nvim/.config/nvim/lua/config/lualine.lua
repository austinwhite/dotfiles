local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "nordfox",
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        separator = { left = '', right = '' },
      }
    },
    lualine_b = {
      'branch',
      'diff'
    },
    lualine_c = {
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
      },
    },
    lualine_x = {
      'encoding',
      'fileformat',
      {
        'filetype',
        colored = true,
        icon_only = false,
        icon = { align = 'right' },
      }
    },
    lualine_y = { 'progress' },
    lualine_z = {
      {
        'location',
        separator = { right = '' }
      }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
      {
        'buffers',
        buffers_color = {
          active = '2E3440',
          inactive = { fg = '8D97A8', bg = '3B4252'},
        },
        mode = 2,
        symbols = {
          modified = ' ●',
          alternate_file = '',
          readonly = ' ',
          directory =  '',
          unnamed = '[No name]',
        }
      }
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {}
}

