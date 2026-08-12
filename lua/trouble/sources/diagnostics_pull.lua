-- Trouble source that triggers Neovim's native pull-based workspace
-- diagnostics before rendering. Trouble core only reads already-published
-- diagnostics, so pull servers never deliver workspace results without this.
-- See https://github.com/folke/trouble.nvim/issues/682
---@type trouble.Source
local M = {}

local function diagnostics()
  return require("trouble.sources.diagnostics")
end

M.highlights = {
  Message = "TroubleText",
  ItemSource = "Comment",
  Code = "Comment",
}

function M.setup()
  diagnostics().setup()
end

---@param cb trouble.Source.Callback
---@param ctx trouble.Source.ctx
function M.get(cb, ctx)
  -- Always pull so results stay fresh. DiagnosticChanged fires when they
  -- arrive and auto_refresh re-renders.
  vim.lsp.buf.workspace_diagnostics()
  diagnostics().get(cb, ctx)
end

return M
