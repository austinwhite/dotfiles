local status_ok, theme = pcall(require, "nord")
if not status_ok then
  return
end

theme.setup()
