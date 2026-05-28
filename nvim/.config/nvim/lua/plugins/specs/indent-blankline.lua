return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "│",
      highlight = "IblIndent",
    },
    scope = {
      enabled = true,
      highlight = "IblScope",
    },
  },
  config = function(_, opts)
    local function set_ibl_highlights()
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#1f232b", nocombine = true })
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#343a46", nocombine = true })
    end

    set_ibl_highlights()

    vim.api.nvim_create_autocmd("ColorScheme", {
      desc = "Keep indent guides subtle",
      callback = set_ibl_highlights,
    })

    require("ibl").setup(opts)
  end,
}
