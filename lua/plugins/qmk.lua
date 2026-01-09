return {
  "codethread/qmk.nvim",
  config = function()
    local conf = {
      name = "endgame",
      variant = "zmk",
      layout = {
        "x x x x x _ x x x x x",
        "x x x x x _ x x x x x",
        "x x x x x _ x x x x x",
        "x _ _ x x _ x x _ _ x",
      },
    }
    require("qmk").setup(conf)
  end,
}
