local status_ok, theme = pcall(require, 'github-theme')
if not status_ok then
  return
end

theme.setup({
  theme_style = 'dimmed',
  comment_style = 'italic',
  keyword_style = 'italic',
  function_style = 'italic',
  variable_style = 'italic',
})
