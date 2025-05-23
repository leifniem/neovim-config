return {
  "metalelf0/black-metal-theme-neovim",
  lazy = false,
  enabled = false,
  priority = 1000,
  config = function()
    require("black-metal").setup({
      theme = "dark-funeral",
      alt_bg = false,
      plain_float = true,
      transparent = true,
    })
    require("black-metal").load()
  end,
}
