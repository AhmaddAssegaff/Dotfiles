return {
  "folke/noice.nvim",
  opts = function(_, opts)
    opts.presets = {
      command_palette = {
        views = {
          cmdline_popup = {
            position = {
              row = "50%",
              col = "50%",
              anchor = "CC",
            },
            size = {
              min_width = 60,
              width = "auto",
              height = "auto",
            },
          },
          popupmenu = {
            relative = "editor",
            position = {
              row = "50%",
              col = "50%",
              anchor = "CC",
            },
            size = {
              width = 60,
              height = "auto",
              max_height = 15,
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
            },
          },
        },
      },
    }

    opts.lsp = opts.lsp or {}
    opts.lsp.signature = {
      opts = { size = { max_height = 15 } },
    }

    opts.lsp.override = {
      ["vim.ui.input"] = false,
      ["vim.ui.select"] = false,
    }
  end,
}
