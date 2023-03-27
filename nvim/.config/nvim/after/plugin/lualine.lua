local lualine = require("lualine")

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {},
		lualine_c = { { "filename", symbols = { readonly = "", modified = "" } } },
		lualine_x = { "diagnostics", "branch" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
