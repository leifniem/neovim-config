return {
  "nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = false,
      float = {
        border = "rounded",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
        },
        numhl = {
          [vim.diagnostic.severity.WARN] = "WarningMsg",
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
          [vim.diagnostic.severity.HINT] = "DiagnosticHint",
        },
      },
    },
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "LazyVim" },
            },
          },
        },
      },
      oxlint = {
        enabled = true,
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
      },
      vtsls = {
        enabled = true,
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
      },
      -- `tsgo` was renamed to `tsc` in nvim-lspconfig 033492ba (TS 7.0 stable
      -- ships the Go compiler as the regular `typescript` package / `tsc` bin).
      -- Still not a vtsls replacement: TS 7.0.2's LSP implements exactly one
      -- quickfix ("Implement interface") and zero refactors. A bare
      -- vim.lsp.buf.code_action() (what <leader>ca sends) is empty for missing
      -- imports, unused decls, spelling, implicit any, add-async, etc. It only
      -- serves source-kind actions (organizeImports/sortImports/
      -- removeUnusedImports/fixAll). Re-test when quickfixes land upstream.
      tsc = {
        enabled = false,
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
      },
      eslint = {
        enabled = true,
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
      },
      emmet_language_server = {
        cmd = { "emmet-language-server", "--stdio" },
        filetypes = {
          "astro",
          "css",
          "eruby",
          "html",
          "htmlangular",
          "htmldjango",
          "javascriptreact",
          "less",
          "pug",
          "sass",
          "scss",
          "svelte",
          "templ",
          "typescriptreact",
          "vue",
        },
        root_markers = { ".git" },
      },
      fallow = {
        cmd = { "fallow-lsp" },
        root_markers = { ".fallowrc.json", "package.json", ".git" },
        init_options = {
          -- Every issue type is enabled by default. List only the ones you
          -- want to turn off; any key you omit stays enabled.
          issueTypes = {
            ["coverage-gaps"] = false,
          },
        },
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
      },
      taplo = { enabled = false, mason = false },
      texlab = { enabled = false, mason = false },
    },
  },
}
