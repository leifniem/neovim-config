return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  enabled = false,
  opts = {
    disabled_keys = {
      ["<Up>"] = { "n", "x" },
      ["<Left>"] = { "n", "x" },
      ["<Right>"] = { "n", "x" },
      ["<Down>"] = { "n", "x" },
    },
    restricted_keys = {
      ["h"] = {},
      ["j"] = {},
      ["k"] = {},
      ["l"] = {},
    },
    disable_mouse = true,
  },
}
