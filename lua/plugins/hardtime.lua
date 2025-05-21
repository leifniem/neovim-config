return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    disabled_keys = {
      ["<Up>"] = { "n", "x" },
      ["<Left>"] = { "n", "x" },
      ["<Right>"] = { "n", "x" },
      ["<Down>"] = { "n", "x" },
    },
    restricted_keys = {
      ["h"] = { "n" },
      ["j"] = { "n" },
      ["k"] = { "n" },
      ["l"] = { "n" },
    },
    disable_mouse = false,
  },
}
