local status_ok, supermaven = pcall(require, "supermaven-nvim")
if not status_ok then
  return
end

supermaven.setup({})
