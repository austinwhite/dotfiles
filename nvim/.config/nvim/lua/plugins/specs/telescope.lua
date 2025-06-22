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
      pickers = {
        find_files = {
          theme = "ivy",
        },
        buffers = {
          theme = "ivy",
        },
        help_tags = {
          theme = "ivy",
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
        require("telescope.builtin").find_files()
      end,
      desc = "Telescope find files",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Telescope buffers",
    },
    {
      "<leader>en",
      function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end,
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Telescope help tags",
    },
  },
}
