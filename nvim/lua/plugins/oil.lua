return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      -- Disable defaults that conflict with vim-tmux-navigator
      ["<C-h>"] = false,
      ["<C-l>"] = false,
      -- Remap toggle hidden from C-h to <leader>h
      ["<leader>h"] = "actions.toggle_hidden",
      ["<leader>r"] = "actions.refresh",
    },
  },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open file explorer" },
  },
}
