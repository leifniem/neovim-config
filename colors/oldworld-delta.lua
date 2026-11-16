-- oldworld.nvim with the Delta Icons palette (github.com/Delta-Icons/themes, iterm2/theme.itermcolors)
local delta = {
  bg = "#000000",
  fg = "#e4e4e4",
  subtext1 = "#c8c8cc",
  subtext2 = "#ababb0",
  subtext3 = "#989898",
  subtext4 = "#707076",
  bg_dark = "#000000",
  black = "#000000",
  red = "#ff827b",
  green = "#97de9c",
  yellow = "#fadf80",
  purple = "#bf9bff",
  magenta = "#dac0ff",
  orange = "#f9c28b",
  blue = "#9ac0ff",
  cyan = "#95e1d5",
  gray0 = "#000000",
  gray1 = "#141418",
  gray2 = "#1a1a1f",
  gray3 = "#26262c",
  gray4 = "#303037",
  gray5 = "#44444b",
  none = "NONE",
}

-- ponytail: patches oldworld's palette table in place; breaks if oldworld renames palette keys.
local p = require("oldworld.palette")
for k, v in pairs(delta) do
  p[k] = v
end
require("oldworld").colorscheme()
vim.g.colors_name = "oldworld-delta"
vim.api.nvim_set_hl(0, "Visual", { bg = "#54688e" }) -- the iTerm selection color
vim.g.terminal_color_0 = "#000000"
vim.g.terminal_color_8 = "#989898"
