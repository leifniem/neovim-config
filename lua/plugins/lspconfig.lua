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
  },
  servers = {
    --- @deprecated -- tsserver renamed to ts_ls but not yet released, so keep this for now
    --- the proper approach is to check the nvim-lspconfig release version when it's released to determine the server name dynamically
    tsserver = {
      enabled = false,
    },
    ts_ls = {
      enabled = false,
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
    codelldb = { enabled = false, mason = false },
    debugpy = { enabled = false, mason = false },
    delve = { enabled = false, mason = false },
    gitui = { enabled = false, mason = false },
    gofumpt = { enabled = false, mason = false },
    goimports = { enabled = false, mason = false },
    gopls = { enabled = false, mason = false },
    pyright = { enabled = false, mason = false },
    ruff = { enabled = false, mason = false },
    shellcheck = { enabled = false, mason = false },
    shfmt = { enabled = false, mason = false },
    stylelint = { enabled = false, mason = false },
    stylua = { enabled = false, mason = false },
    taplo = { enabled = false, mason = false },
    texlab = { enabled = false, mason = false },
    volar = { enabled = false, mason = false },
  },
  setup = {
    --- @deprecated -- tsserver renamed to ts_ls but not yet released, so keep this for now
    --- the proper approach is to check the nvim-lspconfig release version when it's released to determine the server name dynamically
    tsserver = function()
      -- disable tsserver
      return true
    end,
    ts_ls = function()
      -- disable tsserver
      return true
    end,
    eslint = function(_, opts)
      LazyVim.lsp.on_attach(function(client)
        if client.name == "eslint" then
          client.server_capabilities.documentFormattingProvider = true
        elseif client.name == "tsserver" then
          client.server_capabilities.documentFormattingProvider = false
        end
      end)
    end,
  },
}
