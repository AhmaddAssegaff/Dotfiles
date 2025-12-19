return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters = vim.tbl_extend("force", opts.formatters or {}, require("config.formatters"))

    opts.formatters_by_ft = {
      javascript = { "biome" },
      typescript = { "biome" },
      lua = { "stylua" },
      python = { "black" },
      sh = { "shfmt" },
      go = { "gofmt" },
    }

    opts.format_on_save = {
      timeout_ms = 500,
      lsp_fallback = false,
    }

    return opts
  end,
}
