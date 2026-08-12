return {
  "folke/trouble.nvim",
  opts = {
    modes = {
      workspace_diagnostics = {
        mode = "diagnostics",
        source = "diagnostics_pull",
        title = "Workspace Diagnostics",
        auto_refresh = true,
        auto_close = false,
      },
    },
  },
  keys = {
    { "<leader>xw", "<cmd>Trouble workspace_diagnostics toggle<cr>", desc = "Workspace Diagnostics (Trouble)" },
  },
}
