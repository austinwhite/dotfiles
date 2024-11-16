return {
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
