local telescope = require("telescope")

telescope.setup({
	defaults = {
		prompt_prefix = "filter: ",
		selection_caret = " ",
	},
	pickers = {
		find_files = {
			theme = "ivy",
		},
		live_grep = {
			theme = "ivy",
		},
		buffers = {
			theme = "ivy",
			initial_mode = "normal",
		},
		help_tags = {
			theme = "ivy",
		},
		grep_string = {
			theme = "ivy",
		},
		git_files = {
			theme = "ivy",
		},
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			initial_mode = "normal",
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- insert mode mappings
				},
				["n"] = {
					-- normal mode mappings
				},
			},
		},
	},
})

telescope.load_extension("file_browser")

local builtin = require("telescope.builtin")
local extensions = require("telescope").extensions

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>rw", extensions.file_browser.file_browser, {})
