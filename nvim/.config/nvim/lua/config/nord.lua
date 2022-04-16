local status_ok, nord = pcall(require, "nord")
if not status_ok then
  return
end

vim.g.nord_contrast = true
vim.g.nord_italic = false

nord.set()
