local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup({
  defaults = {
    prompt_prefix = ": ",
    selection_caret = " ",
    ripgrep_arguments = {
      'rg',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--no-ignore'
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class",
		"%.pdf", "%.mkv", "%.mp4", "%.zip"},
    },
    live_grep = {
    },
    buffers = {
    },
    help_tags = {
    },
    grep_string = {
    },
    git_files = {
    }
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
      hidden = true,
      mappings = {
        ["i"] = {
          -- insert mode mappings
        },
        ["n"] = {
          -- normal mode mappings
        }
      }
    }
  }
})

telescope.load_extension("file_browser")

local builtin = require("telescope.builtin")
--local extensions = require("telescope").extensions

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
--vim.keymap.set("n", "<leader>rw", extensions.file_browser.file_browser, {})
