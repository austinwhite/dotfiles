return {
  "eoh-bse/minintro.nvim",
  enabled = function()
    if vim.fn.argc() ~= 1 then
      return true
    end

    return vim.fn.isdirectory(vim.fn.argv(0)) == 0
  end,
  opts = { color = "#ecf2f8" },
  config = true,
  lazy = false,
}
