return {
  -- Fallback for LSP servers without native `workspace/diagnostic` (push-only).
  -- Servers that do support it are handled natively; see lua/trouble/sources/diagnostics_pull.lua.
  "artemave/workspace-diagnostics.nvim",
  -- init (not keys/event) so the LspAttach autocmd exists from startup; the
  -- require inside triggers the actual lazy load on first attach.
  init = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("workspace_diagnostics", { clear = true }),
      callback = function(args)
        for _, client in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
          if client:supports_method("workspace/diagnostic", args.buf) then
            vim.lsp.buf.workspace_diagnostics({ client_id = client.id })
          else
            -- no-op after the first call per client
            require("workspace-diagnostics").populate_workspace_diagnostics(client, args.buf)
          end
        end
      end,
    })
  end,
}
