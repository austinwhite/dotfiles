return {
  "tpope/vim-fugitive",
  cmd = {
    "Git",
    "G",
    "Gdiffsplit",
    "Gread",
    "Gwrite",
    "Ggrep",
    "GMove",
    "GRename",
    "GDelete",
    "GBrowse",
  },
  keys = {
    { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
  },
}
