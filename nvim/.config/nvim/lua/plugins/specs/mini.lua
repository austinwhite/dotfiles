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
    local backdrop = nil

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesExplorerOpen",
      callback = function()
        if backdrop and vim.api.nvim_win_is_valid(backdrop) then
          return
        end

        local buf = vim.api.nvim_create_buf(false, true)
        backdrop = vim.api.nvim_open_win(buf, false, {
          relative = "editor",
          row = 0,
          col = 0,
          width = vim.o.columns,
          height = vim.o.lines,
          focusable = false,
          style = "minimal",
          border = "none",
          zindex = 1,
        })

        vim.api.nvim_set_hl(0, "MiniFilesBackdrop", { bg = "#000000" })
        vim.wo[backdrop].winhighlight = "Normal:MiniFilesBackdrop"
        vim.wo[backdrop].winblend = 55
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesExplorerClose",
      callback = function()
        if backdrop and vim.api.nvim_win_is_valid(backdrop) then
          vim.api.nvim_win_close(backdrop, true)
        end
        backdrop = nil
      end,
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
