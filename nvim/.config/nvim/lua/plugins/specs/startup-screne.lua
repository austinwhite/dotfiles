return {
  "eoh-bse/minintro.nvim",
  -- `minintro` tries to replace/delete the startup buffer on VimEnter.
  -- When starting Neovim with a directory, `mini.files` (as the default
  -- explorer) has already taken over that buffer, so minintro can end up
  -- deleting an invalid buffer. Keep the intro for plain `nvim`, but skip it
  -- for `nvim <directory>` so mini.files opens cleanly.
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
