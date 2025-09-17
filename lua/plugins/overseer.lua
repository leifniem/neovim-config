return {
  "stevearc/overseer.nvim",
  opts = {
    task_list = {
      bindings = {
        ["dd"] = "Stop",
      },
    },
  },
  keys = {
    { "<leader>ow", "<cmd>OverseerToggle<cr>", desc = "Task list" },
    { "<leader>oo", "<cmd>OverseerRun<cr>", desc = "Run task" },
    { "<leader>or", "<cmd>OverseerRunCmd<cr>", desc = "Run raw command" },
    { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Action recent task" },
    { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Overseer Info" },
    { "<leader>ob", "<cmd>OverseerBuild<cr>", desc = "Task builder" },
    { "<leader>ot", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
    { "<leader>oc", "<cmd>OverseerClearCache<cr>", desc = "Clear cache" },
  },
  config = function()
    require("overseer").setup({
      actions = {
        ["clear output"] = {
          desc = "Clear the output",
          run = function(task)
            vim.api.nvim_chan_send(task.strategy.term_id, "\027[H\027[2J")
          end,
        },
      },
      task_list = {
        bindings = {
          ["<C-c>"] = "<CMD>OverseerQuickAction clear output<CR>",
        },
      },
    })
    require("overseer").add_template_hook({}, function(task_defn)
      task_defn.strategy = { "jobstart", preserver_output = false, use_terminal = true }
    end)
  end,
}
