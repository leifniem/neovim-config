-- Filled overlays: floats are separated by fill color instead of outlines.
-- Single-row inputs become rounded pills using the rounded-rect caps
-- U+E0D9 (left) / U+E0D8 (right) from the patched PaperMono Nerd Font.
-- Set `vim.g.filled_ui = false` in options.lua to go back to outlines.
if vim.g.filled_ui == false then
  return {}
end

-- ponytail: hex instead of oldworld palette lookups, oled variant only
local c = {
  panel = "#1b1b1c", -- floats, picker list
  preview = "#121213", -- picker preview, a step darker than the list
  input = "#2a2a2c", -- pills, selection
  title = "#90b99f", -- oldworld green, same as `Title`
  fg = "#c9c7cd",
  dim = "#6c6874",
  blue = "#92a2d5",
}

local L, R = "\u{E0D9}", "\u{E0D8}"
-- caps only on the sides: the glyphs round both corners of a cell, so they only fit one-row windows
local pill_border = { "", "", "", R, "", "", "", L }
-- The pill window itself has no background, so the cells around the cap curves stay transparent
-- (an explicit bg is drawn opaque by the terminal, e.g. with Ghostty's background-opacity).
-- The fill is the cursorline instead: one-row window, so the cursor is always on it.
local pill_hl = { Normal = "PillNormal", NormalFloat = "PillNormal", CursorLine = "PillFill" }

local function pill_title(title)
  return type(title) == "string" and { { L, "FilledTitleCap" }, { title, "FilledTitle" }, { R, "FilledTitleCap" } }
    or title
end

-- `solid` = spaces drawn in FloatBorder, so every float without an explicit border is a filled block
vim.o.winborder = "solid"

-- autocmd instead of oldworld's highlight_overrides: oldworld.lua sorts after this file and its
-- `bg = NONE` overrides would win the opts merge
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    for group, hl in pairs({
      NormalFloat = { fg = c.fg, bg = c.panel },
      FloatBorder = { fg = c.dim, bg = c.panel },
      FloatTitle = { fg = c.title, bg = c.panel, bold = true },
      FilledTitle = { fg = c.panel, bg = c.title, bold = true },
      FilledTitleCap = { fg = c.title, bg = c.panel },

      BlinkCmpMenu = { fg = c.fg, bg = c.panel },
      BlinkCmpMenuBorder = { bg = c.panel },
      BlinkCmpMenuSelection = { bg = c.input },
      BlinkCmpDoc = { fg = c.fg, bg = c.panel },
      BlinkCmpDocBorder = { bg = c.panel },
      BlinkCmpDocSeparator = { fg = c.dim, bg = c.panel },
      BlinkCmpSignatureHelp = { fg = c.fg, bg = c.panel },
      BlinkCmpSignatureHelpBorder = { bg = c.panel },

      FzfLuaNormal = { fg = c.fg, bg = c.panel },
      FzfLuaBorder = { bg = c.panel },
      FzfLuaPreviewNormal = { fg = c.fg, bg = c.preview },
      FzfLuaPreviewBorder = { bg = c.preview },
      FzfLuaPreviewTitle = { fg = c.title, bg = c.preview, bold = true },
      FzfLuaCursorLine = { bg = c.input },
      FzfLuaTitleFlags = { fg = c.dim, bg = c.panel },

      -- pills: no bg on the window or the caps, see `pill_hl`
      PillNormal = { fg = c.fg },
      PillFill = { bg = c.input }, -- bg only: an fg on CursorLine would override the text colors
      PillCap = { fg = c.input },
      NoiceCmdlinePopupBorder = { fg = c.input }, -- noice links its per-mode border groups to this one
      NoiceCmdlineIcon = { fg = c.blue, bg = c.input }, -- drawn as virtual text, which doesn't get the cursorline
      SnacksInputIcon = { fg = c.title, bg = c.input },
      SnacksInputTitle = { fg = c.dim, bg = c.input },
      SnacksPickerInput = { fg = c.fg, bg = c.input },
      SnacksPickerPrompt = { fg = c.title, bg = c.input },
      SnacksPickerTotals = { fg = c.dim, bg = c.input },
    }) do
      vim.api.nvim_set_hl(0, group, hl)
    end
  end,
})

return {
  {
    "folke/noice.nvim",
    opts = {
      views = {
        -- padding = false: with padding nui draws the border as its own window, filled like the popup.
        -- The fold column stands in for the left padding instead
        cmdline_popup = {
          border = { style = pill_border, padding = false },
          win_options = {
            cursorline = true,
            foldcolumn = "1",
            winhighlight = vim.tbl_extend("force", pill_hl, { FoldColumn = "PillFill", CursorLineFold = "PillFill" }),
          },
        },
        cmdline_input = { border = { style = pill_border, padding = false } }, -- rest comes from cmdline_popup
        cmdline_popupmenu = {
          position = { row = 5 }, -- pill has no top/bottom border rows, keep the menu right below it
          border = { style = "solid", padding = { 0, 1 } },
          win_options = { winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" } },
        },
        confirm = { border = { style = "solid" } },
        popup = { border = { style = "solid" } },
      },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      input = { prompt_pos = "left" }, -- no top border for a title, so the prompt goes inline
      styles = {
        input = {
          border = pill_border,
          wo = {
            cursorline = true,
            winhighlight = "NormalFloat:PillNormal,CursorLine:PillFill,CursorLineNr:PillFill,FloatBorder:PillCap,FloatTitle:SnacksInputTitle",
          },
        },
      },
      picker = {
        layouts = {
          -- snacks' sidebar layout, input as a pill and a filled preview
          sidebar = {
            preview = "main",
            layout = {
              backdrop = false,
              width = 40,
              min_width = 40,
              height = 0,
              position = "left",
              border = "none",
              box = "vertical",
              -- caps on a transparent box around the input: the input fills its whole window,
              -- including the virtual text the picker draws, which a cursorline fill would miss
              {
                box = "vertical",
                height = 1,
                border = pill_border,
                wo = { winhighlight = "NormalFloat:PillNormal,FloatBorder:PillCap" },
                { win = "input", height = 1, border = "none" },
              },
              { win = "list", border = "none" },
              { win = "preview", title = "{preview}", height = 0.4, border = "solid" },
            },
          },
        },
      },
    },
  },

  { "folke/which-key.nvim", opts = { win = { border = "solid" } } },

  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      opts.winopts.border = "solid"
      opts.winopts.preview.border = "solid"
      -- titles come from the default-title profile, merged later in LazyVim's config(): patch the cached module
      local function pill_titles(t)
        for k, v in pairs(t) do
          if k == "winopts" then
            v.title = pill_title(v.title)
          elseif type(v) == "table" then
            pill_titles(v)
          end
        end
      end
      pill_titles(require("fzf-lua.profiles.default-title"))
      local ui_select = opts.ui_select
      opts.ui_select = function(...)
        local o = ui_select(...)
        o.winopts.title = pill_title(o.winopts.title)
        return o
      end
    end,
  },
}
