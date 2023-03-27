require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"help",
		"query",
		"vim",
		"c",
		"cpp",
		"javascript",
		"typescript",
		"rust",
		"bash",
		"lua",
		"python",
		"haskell",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
