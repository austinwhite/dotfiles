local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = { "" },

  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = { "" }
  },
  rainbow = {
    enable = true,
    disable = { "jsx", "cpp" },
    extended_mode = true,
    max_file_lines = nil,
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
