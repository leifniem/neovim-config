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
        { "filetype", icon_only = true },
        {
          "filename",
          padding = 0,
          buffers_color = {
            active = { bg = "#4a4a4a", fg = "#FFFFFF" },
            inactive = { bg = "#202025", fg = "#8A8A8A" },
          },
          separator = { left = "", right = "" },
          show_modified_status = false,
          path = 1,
          symbols = {
            alternate_file = "",
            newfile = "",
            unnamed = "",
          },
        },
      },
      lualine_x = {
        -- {
        --   "diagnostics",
        --   symbols = { error = " ", warn = " ", info = " ", hint = " " },
        --   update_in_insert = true,
        -- },
        {
          "overseer",
        },
      },
      lualine_y = {
        {
          "branch",
          icon = "",
          separator = { left = " ", right = "" },
        },
        { "location", separator = { left = "", right = " " }, icon = "" },
      },
      lualine_z = {
        {
          "datetime",
          style = "%H:%M",
          separator = { left = " ", right = "" },
        },
      },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = { "location", "progress" },
      lualine_y = { "location", "progress" },
      lualine_z = {},
    },
  },
}
