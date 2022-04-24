local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

-- set header
-- dashboard.section.header.val = {}

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button( "e", "  New" , ":ene <BAR> startinsert<CR>"),
  dashboard.button( "f", "  Find", ":Telescope find_files<CR>"),
  dashboard.button( "r", "  Recent" , ":Telescope oldfiles<CR>"),
  dashboard.button( "c", "  Config", ":cd $NVIMCONFIG | Telescope file_browser<CR>"),
  dashboard.button( "q", "  Quit", ":qa<CR>"),
}

local function footer()
  local v = vim.version()
  local datetime = os.date " %m-%d-%Y   %H:%M"
  return string.format(" v%d.%d.%d  %s", v.major, v.minor, v.patch, datetime)
end

-- footer
dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = dashboard.section.header.opts.hl

alpha.setup (
  dashboard.config
)
