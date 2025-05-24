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
        jestCommand = "npm run test -- ",
        env = { CI = true },
        jestConfigFile = function()
          local file = vim.fn.expand("%:p")
          if string.find(file, "/packages/") then
            return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
          end
          return vim.fn.getcwd() .. "/jest.config.ts"
        end,
        cwd = function()
          local file = vim.fn.expand("%:p")
          if string.find(file, "/packages/") then
            return string.match(file, "(.-/[^/]+/)src")
          end
          return vim.fn.getcwd()
        end,
      },
    },
    consumers = {
      overseer = function()
        require("neotest.consumers.overseer")
      end,
    },
    -- overseer = {
    --   enabled = true,
    --   -- When this is true (the default), it will replace all neotest.run.* commands
    --   force_default = true,
    -- },
  },
}
