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
      disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
      icons_enabled = true,
      -- theme = theme,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        { "mode", separator = { left = " ", right = "" } },
      },
      lualine_c = {
        --   -- {
        --   --   "diff",
        --   --   symbols = { added = " ", modified = " ", removed = " " },
        --   --   colored = true,
        --   -- },
      },
      lualine_b = {
        {
          "filename",
          buffers_color = {
            active = { bg = "#4a4a4a", fg = "#FFFFFF" },
            inactive = { bg = "#202025", fg = "#8A8A8A" },
          },
          separator = { left = " ", right = "" },
          show_modified_status = false,
          symbols = {
            alternate_file = "",
          },
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
        {
          "branch",
          icon = "",
          separator = { left = " ", right = "" },
        },
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
