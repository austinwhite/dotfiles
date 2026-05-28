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
    })
    local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
    vim.api.nvim_set_hl(0, "MiniFilesBorder", { fg = "#535965", bg = normal_bg })
    vim.api.nvim_set_hl(0, "MiniFilesNormal", { bg = normal_bg })
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

local notify = {
  "echasnovski/mini.notify",
  version = false,
  config = function()
    require("mini.notify").setup({})
    vim.notify = require("mini.notify").make_notify()

    local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
    vim.api.nvim_set_hl(0, "MiniNotifyBorder", { fg = "#535965", bg = normal_bg })
    vim.api.nvim_set_hl(0, "MiniNotifyNormal", { bg = normal_bg })
  end,
}

return { files, hipattern, notify }
