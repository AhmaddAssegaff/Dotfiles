return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "stevearc/oil.nvim", enabled = false },
  {
    "LazyVim/LazyVim",
    opts = {
      keys = {
        { "<leader>e", false },
        { "<leader>E", false },
        { "-", false },
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      input = {
        enabled = false,
      },
      select = {
        enabled = false,
      },
      dashboard = { enabled = false },
      explorer = { enabled = false },
    },
  },
}
