return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    windows = {
      position = "right",
    },
  },
  keys = {
    {
      "<leader>e",
      opts = {
        position = "right",
      },
      desc = "Explorer NeoTree (cwd)",
    },
    { "<leader>E", opts = {
      position = "right",
    }, desc = "Explorer NeoTree (cwd)" },
  },
}
