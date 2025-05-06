return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neotest/nvim-nio",
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-jest",
  },

  opts = {
    summary = {
      open = "botright vsplit | vertical resize 80",
    },
    adapters = {
      ["neotest-jest"] = {
        jestCommand = "npm test --",
        env = { CI = true },
        cwd = function()
          return vim.fn.getcwd()
        end,
      },
    },
  },
}
