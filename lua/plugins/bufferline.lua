return {
  "akinsho/bufferline.nvim",
  ---@module 'bufferline'
  ---@type bufferline.Config
  opts = {
    options = {
      themable = true,
      always_show_bufferline = true,
      separator_style = "thick",
      hover = {
        enabled = true,
        delay = 120,
        reveal = { "close" },
      },
    },
    highlights = {
      fill = {
        bg = "none",
      },
      background = {
        bg = "none",
      },
    },
  },
}
