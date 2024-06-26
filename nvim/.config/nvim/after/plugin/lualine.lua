local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = {
      left = "",
      right = ""
    },
    section_separators = {
      left = "",
      right = ""
    },
    disabled_filetypes = {
      statusline = { 'packer', 'NVimTree', 'Alpha' },
      winbar = {},
    },
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff", "diagnostics"},
    lualine_c = {{
      "filename",
      symbols = {
        readonly = "",
        modified = ""
      }
    }},
    lualine_x = {"encoding", "fileformat", "filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  tabline = {
    lualine_a = {"buffers"},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {}
})
