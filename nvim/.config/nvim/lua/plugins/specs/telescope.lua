return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
  config = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "TelescopeFindPre",
      callback = function()
        require("core.utils").open_backdrop("telescope", { hl = "TelescopeBackdrop" })
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "TelescopePrompt",
      callback = function(args)
        vim.api.nvim_create_autocmd("BufWipeout", {
          buffer = args.buf,
          once = true,
          callback = function()
            require("core.utils").close_backdrop("telescope")
          end,
        })
      end,
    })

    require("telescope").setup({
      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        preview = {
          treesitter = false,
        },
      },
      extensions = {
        fzf = {},
      },
    })

    require("telescope").load_extension("fzf")
  end,
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files(require("telescope.themes"))
      end,
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers(require("telescope.themes"))
      end,
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags(require("telescope.themes"))
      end,
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep(require("telescope.themes"))
      end,
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").lsp_document_symbols(require("telescope.themes"))
      end,
    },
  },
}
