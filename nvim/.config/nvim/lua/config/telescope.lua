local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.setup({
  defaults = {
    prompt_prefix =  " ",
    selection_caret = " ",

    mappings = {
      i = {}
    }
  },
  pickers = {
    find_files = {
      theme = 'ivy',
      hidden = true,
    },
    live_grep = {
      theme = 'ivy',
    },
    buffers = {
      theme = 'ivy',
    },
    help_tags = {
      theme = 'ivy',
    },
  },
  extensions = {
    file_browser = {
      theme = 'ivy',
    },
  }
})

telescope.load_extension('file_browser')
