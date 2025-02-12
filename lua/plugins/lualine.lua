local clients_lsp = function()
  local bufnr = vim.api.nvim_get_current_buf()

  local clients = vim.lsp.get_clients()
  if next(clients) == nil then
    return ""
  end

  local c = {}
  for _, client in pairs(clients) do
    table.insert(c, client.name)
  end
  return " " .. table.concat(c, "|")
end

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = {
        { "mode", separator = { left = " ", right = "" } },
      },
      lualine_b = {
        {
          "branch",
          icon = "",
          separator = { left = " ", right = "" },
        },
        {
          "diff",
          symbols = { added = " ", modified = " ", removed = " " },
          colored = true,
        },
      },
      lualine_c = {
        {
          "buffers",
          -- buffers_color = {
          --   active = { bg, fg }
          --   inactive = { bg, fg }
          -- }
        },
      },
      lualine_x = {
        {
          "diagnostics",
          symbols = { error = " ", warn = " ", info = " ", hint = " " },
          update_in_insert = true,
        },
      },
      lualine_y = { clients_lsp },
      lualine_z = {
        { "location", separator = { left = "", right = " " }, icon = "" },
      },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
  },
}
