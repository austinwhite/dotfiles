local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

-- add html snips to js/jsx
luasnip.filetype_extend("javascriptreact", { "html" })
luasnip.filetype_extend("javascript", { "html" })

-- add html snips to ts/tsx
luasnip.filetype_extend("typescriptreact", { "html" })
luasnip.filetype_extend("typescript", { "html" })
