return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = function(_, opts)
    opts.linters_by_ft = opts.linters_by_ft or {}
    local linter = vim.fn.executable("oxlint") == 1 and "oxlint" or "eslint"
    for _, ft in ipairs({
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    }) do
      opts.linters_by_ft[ft] = { linter }
    end
  end,
}
