return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup({
        settings = {
          complete_function_calls = true,
          expose_as_code_action = "all",
        },
      })
    end,
    ft = {
      "typescript",
      "typescript.tsx",
      "typescriptreact",
      "javascript",
      "javascript.jsx",
      "javascriptreact",
    },
    keys = {
      -- aclrdsf
      -- { "gD", "<cmd>TSToolsGoToSourceDefinition<cr>", desc = "TSTools: Goto Source Definition" },
      --   {
      --     "gR",
      --     function()
      --       LazyVim.lsp.execute({
      --         command = "typescript.findAllFileReferences",
      --         arguments = { vim.uri_from_bufnr(0) },
      --         open = true,
      --       })
      --     end,
      --     desc = "File References",
      --   },
      --   {
      --     "<leader>co",
      --     LazyVim.lsp.action["source.organizeImports"],
      --     desc = "Organize Imports",
      --   },
      --   {
      --     "<leader>cM",
      --     LazyVim.lsp.action["source.addMissingImports.ts"],
      --     desc = "Add missing imports",
      --   },
      --   {
      --     "<leader>cu",
      --     LazyVim.lsp.action["source.removeUnused.ts"],
      --     desc = "Remove unused imports",
      --   },
      --   {
      --     "<leader>cD",
      --     LazyVim.lsp.action["source.fixAll.ts"],
      --     desc = "Fix all diagnostics",
      --   },
      --   {
      --     "<leader>cV",
      --     function()
      --       LazyVim.lsp.execute({ command = "typescript.selectTypeScriptVersion" })
      --     end,
      --     desc = "Select TS workspace version",
      --   },
    },
  },
  { "yioneko/nvim-vtsls", enabled = false },
}
