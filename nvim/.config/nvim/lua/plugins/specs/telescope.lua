return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
  config = function()
    -- Compatibility shim for telescope 0.1.8 with nvim-treesitter's main branch.
    -- Telescope's current_buffer_fuzzy_find still expects old nvim-treesitter APIs.
    local ok_parsers, parsers = pcall(require, "nvim-treesitter.parsers")
    if ok_parsers and parsers.ft_to_lang == nil then
      parsers.ft_to_lang = function(ft)
        return vim.treesitter.language.get_lang(ft) or ft
      end
    end

    if not pcall(require, "nvim-treesitter.configs") then
      package.loaded["nvim-treesitter.configs"] = {
        is_enabled = function()
          return false
        end,
      }
    end

    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        preview = {
          treesitter = false,
        },
        mappings = {
          i = {
            ["<Esc><Esc>"] = actions.close,
          },
          n = {
            ["<Esc><Esc>"] = actions.close,
            q = actions.close,
          },
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
      desc = "Find files",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Find buffers",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Find help",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Live grep",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      desc = "Find document symbols",
    },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").oldfiles()
      end,
      desc = "Find recent files",
    },
    {
      "<leader>/",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      desc = "Search current buffer",
    },
    {
      "<leader>fd",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "Find diagnostics",
    },
    {
      "<leader>fR",
      function()
        require("telescope.builtin").resume()
      end,
      desc = "Resume picker",
    },
    {
      "<leader>fk",
      function()
        require("telescope.builtin").keymaps()
      end,
      desc = "Find keymaps",
    },
    {
      "<leader>p",
      function()
        require("telescope.builtin").git_files()
      end,
      desc = "Find git files",
    },
  },
}
