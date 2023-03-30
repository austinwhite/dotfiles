vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })

	use({ "projekt0n/github-nvim-theme", tag = "v0.0.7" })

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = {
			{ "nvim-lua/plenary.nvim" },

			-- extensions
			{ "nvim-telescope/telescope-file-browser.nvim" },
		},
	})

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/playground" })

	use({ "ThePrimeagen/harpoon" })

	use({ "mbbill/undotree" })

	use({ "tpope/vim-fugitive" })

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- lsp Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },

			-- dap and lsp support
			{ "jose-elias-alvarez/null-ls.nvim" },
		},
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = "nvim-tree/nvim-web-devicons",
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
	})

	use({
		"lukas-reineke/virt-column.nvim",
		config = function()
			require("virt-column").setup({})
		end,
	})

	use({ "goolord/alpha-nvim" })
end)
