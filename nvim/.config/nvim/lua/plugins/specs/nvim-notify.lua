return {
  "rcarriga/nvim-notify",
  lazy = false,
  opts = {
    stages = "fade_in_slide_out",
    timeout = 3000,
    background_colour = "#000000",
    render = "default",
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)
    vim.notify = notify
  end,
}
