local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

-- for .js files also load html and react snipets
luasnip.filetype_extend("javascript", { "javascriptreact" })
luasnip.filetype_extend("javascript", { "html" })
