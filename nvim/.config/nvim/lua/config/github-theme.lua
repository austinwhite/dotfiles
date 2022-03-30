local status_ok, theme = pcall(require, "github-theme")
if not status_ok then
  return
end

theme.setup({
    theme_style = "dark",
    function_style = "italic",
    sidebars = {"qf", "vista_kind", "terminal", "packer"},
    dark_float = true,
    dark_sidebar = true,
  
    colors = {
      hint = "orange",
      error = "#ff0000",
      bg_search = "#FFD700",
    },
  
    overrides = function(c)
      return {
        htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
        DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
        -- this will remove the highlight groups
        TSField = {},
      }
    end
})