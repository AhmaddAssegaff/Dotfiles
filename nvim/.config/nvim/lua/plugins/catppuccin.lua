return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "auto",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = false,
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          treesitter = true,
          notify = true,
          mini = true,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  {
    "catppuccin/nvim",
    keys = {
      {
        "<leader>ut",
        function()
          local current = vim.o.background
          if current == "dark" then
            vim.o.background = "light"
          else
            vim.o.background = "dark"
          end
          vim.cmd.colorscheme("catppuccin")
          print("Theme switched to " .. vim.o.background)
        end,
        desc = "Toggle Theme (Dark/Light)",
      },
    },
  },
}
