return {
  "kdheepak/lazygit.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open Lazygit" },
  },
  init = function()
    vim.g.lazygit_floating_window_scaling_factor = 0.7
    vim.g.lazygit_config_file_path = "/path/khusus/config.yml"
  end,
}
