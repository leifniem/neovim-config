return {
  "akinsho/bufferline.nvim",
  ---@module 'bufferline'
  ---@type bufferline.Config
  opts = {
    options = {
      always_show_bufferline = true,
      separator_style = "thick",
      hover = {
        enabled = true,
        delay = 120,
        reveal = { "close" },
      },
    },
  },
}
