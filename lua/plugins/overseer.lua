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
    -- ponytail: builtin npm template joins workspace entries literally, so globs like "packages/*" never match.
    -- This fills only the glob gap; builtin still covers root + literal workspaces. Object-form `workspaces` not handled.
    local lockfiles = { ["yarn.lock"] = "yarn", ["pnpm-lock.yaml"] = "pnpm", ["package-lock.json"] = "npm", ["bun.lock"] = "bun" }
    require("overseer").register_template({
      name = "npm workspace globs",
      generator = function(opts)
        local files = require("overseer.files")
        local root = vim.fs.root(opts.dir, vim.tbl_keys(lockfiles))
        if not root then
          return "No lockfile found"
        end
        local bin = "npm"
        for file, mgr in pairs(lockfiles) do
          if vim.uv.fs_stat(vim.fs.joinpath(root, file)) then
            bin = mgr
          end
        end
        local ret = {}
        local workspaces = (files.load_json_file(vim.fs.joinpath(root, "package.json")) or {}).workspaces or {}
        for _, pattern in ipairs(workspaces) do
          if pattern:find("*", 1, true) then
            for _, dir in ipairs(vim.fn.glob(vim.fs.joinpath(root, pattern), false, true)) do
              local data = files.load_json_file(vim.fs.joinpath(dir, "package.json"))
              for script in pairs(data and data.scripts or {}) do
                table.insert(ret, {
                  name = string.format("%s[%s] %s", bin, vim.fs.relpath(root, dir), script),
                  builder = function()
                    return { cmd = { bin, "run", script }, cwd = dir }
                  end,
                })
              end
            end
          end
        end
        return ret
      end,
    })
    require("overseer").add_template_hook({}, function(task_defn)
      task_defn.strategy = { "jobstart", preserver_output = false, use_terminal = true }
    end)
  end,
}
