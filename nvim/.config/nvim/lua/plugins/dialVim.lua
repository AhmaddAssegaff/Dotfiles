return {
  {
    "monaqa/dial.nvim",
    event = "VeryLazy",
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],

          augend.case.new({
            types = {
              "snake_case",
              "camelCase",
              "PascalCase",
              "kebab-case",
              "SCREAMING_SNAKE_CASE",
            },
          }),
        },
      })
    end,
  },
}
