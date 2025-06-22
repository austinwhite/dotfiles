return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
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
        require("telescope.builtin").find_files(require("telescope.themes").get_ivy())
      end,
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers(require("telescope.themes").get_ivy())
      end,
    },
    {
      "<leader>en",
      function()
        require("telescope.builtin").find_files(require("telescope.themes").get_ivy({
          cwd = vim.fn.stdpath("config"),
        }))
      end,
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags(require("telescope.themes").get_ivy())
      end,
    },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").lsp_references(require("telescope.themes").get_ivy())
      end,
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep(require("telescope.themes").get_ivy())
      end,
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").lsp_document_symbols(require("telescope.themes").get_ivy())
      end,
    },
  },
}
