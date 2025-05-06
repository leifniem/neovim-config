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
