return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
      },
    })
  end,
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files(require("telescope.themes").get_ivy())
      end,
      desc = "Telescope find files",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep(require("telescope.themes").get_ivy())
      end,
      desc = "Telescope live grep",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").grep_string(require("telescope.themes").get_ivy())
      end,
      desc = "Telescope grep string",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers(require("telescope.themes").get_ivy())
      end,
      desc = "Telescope buffers",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags(require("telescope.themes").get_ivy())
      end,
      desc = "Telescope help tags",
    },
    {
      "<C-p>",
      function()
        require("telescope.builtin").git_files(require("telescope.themes").get_ivy())
      end,
      desc = "Telescope git files",
    },
  },
}
