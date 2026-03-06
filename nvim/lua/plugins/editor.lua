return {
  { "christoomey/vim-tmux-navigator" },
  {
    "vim-test/vim-test",
    keys = {
      { "<leader>t", ":TestNearest<CR>", desc = "Test nearest" },
      { "<leader>T", ":TestFile<CR>", desc = "Test file" },
      { "<leader>a", ":TestSuite<CR>", desc = "Test suite" },
      { "<leader>l", ":TestLast<CR>", desc = "Test last" },
      { "<leader>g", ":TestVisit<CR>", desc = "Test visit" },
    },
  },
  { "tpope/vim-fugitive" },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {},
  },
}
