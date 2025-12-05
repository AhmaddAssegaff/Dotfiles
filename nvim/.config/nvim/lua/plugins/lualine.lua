return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          globalstatus = true,
          icons_enabled = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          padding = 3,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },

          lualine_c = {
            { "filename", path = 1 },
          },

          lualine_x = {
            "filesize",
            "filetype",
            "encoding",
            "fileformat",
          },

          lualine_y = {
            "progress",
          },

          lualine_z = {
            "location",
            { "datetime", style = "%d/%m/%Y %H:%M" },
          },
        },

        tabline = {
          lualine_a = {
            { "buffers", mode = 4 },
          },

          lualine_z = {
            {
              function()
                local ft = vim.bo.filetype ~= "" and vim.bo.filetype or "noft"
                return "󰈔 " .. ft
              end,
              padding = 2,
            },

            {
              function()
                return "󰉻 " .. vim.api.nvim_buf_line_count(0) .. " lines"
              end,
              padding = 2,
            },

            {
              function()
                if vim.bo.modified then
                  return "● modified"
                end
                return ""
              end,
              color = { fg = "#f38ba8" },
              padding = 2,
            },
          },
        },
      })
    end,
  },
}
