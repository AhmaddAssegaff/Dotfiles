local mason = vim.fn.stdpath("data") .. "/mason/bin/"

return {
  biome = {
    command = mason .. "biome",
    args = {
      "format",
      "--stdin-file-path",
      "$FILENAME",
      "--format-with-errors=true",
    },
    stdin = true,
  },
}
