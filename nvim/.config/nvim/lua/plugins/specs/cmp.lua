return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  branch = "v1",
  version = "1.*",
  opts = {
    keymap = { preset = "default" },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      menu = { border = "rounded" },
      documentation = {
        auto_show = false,
        window = { border = "rounded" },
      },
    },
    signature = {
      enabled = true,
      window = { border = "rounded" },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
