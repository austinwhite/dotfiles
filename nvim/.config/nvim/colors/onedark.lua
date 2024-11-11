local status_ok, theme = pcall(require, "onedarkpro")
if not status_ok then
  return
end

theme.setup({})
