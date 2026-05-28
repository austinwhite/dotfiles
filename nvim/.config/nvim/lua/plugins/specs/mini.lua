local files = {
  "echasnovski/mini.files",
  version = false,
  lazy = false,
  dependencies = {
    "echasnovski/mini.icons",
  },
  config = function()
    require("mini.files").setup({
      windows = {
        preview = true,
        width_preview = 50,
      },
      options = {
        use_as_default_explorer = true,
      },
    })
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesWindowOpen",
      callback = function(args)
        local config = vim.api.nvim_win_get_config(args.data.win_id)
        config.border = {
          { "╭", "NormalFloat" },
          { "─", "NormalFloat" },
          { "╮", "NormalFloat" },
          { "│", "NormalFloat" },
          { "╯", "NormalFloat" },
          { "─", "NormalFloat" },
          { "╰", "NormalFloat" },
          { "│", "NormalFloat" },
        }
        vim.api.nvim_win_set_config(args.data.win_id, config)
      end,
    })

  end,
  keys = {
    {
      "<C-b>",
      function()
        local utils = require("core.utils")
        utils.minifiles_toggle()
      end,
    },
  },
}

local hipattern = {
  "echasnovski/mini.hipatterns",
  version = false,
  config = function()
    local hipatterns = require("mini.hipatterns")

    hipatterns.setup({
      highlighters = {
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })
  end,
}

return { files, hipattern }
