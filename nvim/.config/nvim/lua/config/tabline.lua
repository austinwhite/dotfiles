local status_ok, tabline = pcall(require, 'tabline')
if not status_ok then
  return
end

tabline.setup({
  options = {
    section_separators = {'', ''},
    component_separators = {'', ''},
    max_bufferline_percent = 66,
    show_tabs_always = false,
    show_bufnr = false,
    show_filename_only = true,
    modified_icon = ' ',
    show_tabs_only = false,
  },
})
