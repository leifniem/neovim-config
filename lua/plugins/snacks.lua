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

local root_patterns = {
  -- directories
  "client",
  "server",

  -- version control systems
  "_darcs",
  ".hg",
  ".bzr",
  ".svn",
  ".git",

  -- build tools
  "Makefile",
  "CMakeLists.txt",
  "build.gradle",
  "build.gradle.kts",
  "pom.xml",
  "build.xml",

  -- docker
  "Dockerfile",
  "docker-compose.yml",

  -- node.js and javascript
  "package.json",
  "package-lock.json",
  "yarn.lock",
  "bun.lockb",
  ".nvmrc",
  "gulpfile.js",

  -- python
  "requirements.txt",
  "Pipfile",
  "pyproject.toml",
  "setup.py",
  "tox.ini",

  -- rust
  "Cargo.toml",

  -- go
  "go.mod",

  "mix.exs",

  -- configuration files
  ".prettierrc",
  ".prettierrc.json",
  ".prettierrc.yaml",
  ".prettierrc.yml",
  ".eslintrc",
  ".eslintrc.json",
  ".eslintrc.js",
  ".eslintrc.cjs",
  ".eslintignore",
  ".stylelintrc",
  ".stylelintrc.json",
  ".stylelintrc.yaml",
  ".stylelintrc.yml",
  ".editorconfig",
  ".gitignore",

  -- html projects
  "index.html",

  -- miscellaneous
  "README.md",
  "LICENSE",
  ".env",
  ".env.example",
  "config.yaml",
  "config.yml",
  ".terraform",
  ".kitchen.yml",
}
vim.g.root_spec = { root_patterns, "cwd", "lsp" }

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
      -- sources = {
      --   explorer = {
      --     layout = {
      --       border = "hpad",
      --       title = "",
      --       layout = {
      --         title = "",
      --         position = "right",
      --       },
      --     },
      --   },
      -- },
    },
  },
}
