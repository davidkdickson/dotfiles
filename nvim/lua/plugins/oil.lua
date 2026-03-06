return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["-"] = "actions.parent",
    },
  },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open file explorer" },
  },
}
