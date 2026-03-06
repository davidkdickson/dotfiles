return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  config = function()
    require("nvim-treesitter").install({
      "python", "javascript", "typescript", "tsx",
      "sql", "bash",
      "lua", "vim", "vimdoc", "markdown", "json", "yaml", "html", "css",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
