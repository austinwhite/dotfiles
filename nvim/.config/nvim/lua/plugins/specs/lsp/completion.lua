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
      menu = {
        border = "rounded",
        draw = {
          columns = {
            { "kind_icon", "kind", gap = 1 },
            { "label", "label_description", gap = 1 },
            { "source_name" },
          },
        },
      },
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
  config = function(_, opts)
    require("blink.cmp").setup(opts)

    local function apply_completion_highlights()
      local normal_float = vim.api.nvim_get_hl(0, { name = "NormalFloat" })
      local title = vim.api.nvim_get_hl(0, { name = "Title" })
      local comment = vim.api.nvim_get_hl(0, { name = "Comment" })

      vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = normal_float.fg, bg = normal_float.bg })
      vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = title.fg or normal_float.fg, bg = normal_float.bg })
      vim.api.nvim_set_hl(0, "BlinkCmpSource", { fg = comment.fg or normal_float.fg, bg = normal_float.bg })
      vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", { fg = comment.fg or normal_float.fg, bg = normal_float.bg })
    end

    apply_completion_highlights()
    vim.api.nvim_create_autocmd("ColorScheme", {
      desc = "Keep blink.cmp column highlights readable",
      callback = apply_completion_highlights,
    })
  end,
}
