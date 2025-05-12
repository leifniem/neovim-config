return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
      -- message = {
      --   view = "mini ",
      -- },
    },
    cmdline = {
      format = {
        search_down = {
          view = "cmdline",
        },
        search_up = {
          view = "cmdline",
        },
      },
    },
    presets = {
      command_palette = true,
      long_message_to_split = true,
      -- lsp_doc_border = false,
    },
    views = {
      cmdline_popup = {
        -- border = {
        --   style = "none",
        --   padding = { 2, 3 },
        -- },
        filter_options = {},
        -- win_options = {
        --   winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        -- },
      },
    },
  },
}
