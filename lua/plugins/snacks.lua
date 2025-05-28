local excluded = {
  "node_modules/",
  "dist/",
  ".next/",
  ".vite/",
  ".git/",
  ".gitlab/",
  "build/",
  "target/",

  "package-lock.json",
  "pnpm-lock.yaml",
  "yarn.lock",
}

vim.g.root_spec = { "cwd", "lsp" }

return {
  "folke/snacks.nvim",
  opts = {
    -- need notifier for disabling "No notifications available"
    image = { enabled = true },

    indent = {
      chunk = {
        enabled = true,
        only_current = true,
        char = {
          corner_top = "╭",
          corner_bottom = "╰",
          arrow = "─",
        },
      },
    },
    picker = {
      hidden = false,
      -- show files ignored by git like node_modules
      ignored = true,
      exclude = excluded,
      preset = "sidebar",
      layout = { position = "right" },
      sources = {
        explorer = {
          layout = {
            title = "",
            layout = {
              title = "",
              position = "right",
            },
          },
        },
      },
    },
    dashboard = {
      sections = {
        { section = "keys", gap = 1, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
