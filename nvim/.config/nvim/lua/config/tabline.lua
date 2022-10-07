local status_ok, tabline = pcall(require, 'tabline')
if not status_ok then
  return
end

tabline.setup({
  options = {
    section_separators = {'', ''},
    component_separators = {'', ''},
    max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
    show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
    show_bufnr = false, -- this appends [bufnr] to buffer section,
    show_filename_only = false, -- shows base filename only instead of relative path in filename
    modified_icon = " ", -- change the default modified icon
    show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
  }
})
