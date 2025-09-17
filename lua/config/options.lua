-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.numberwidth = 3
vim.opt.signcolumn = "yes:1"
vim.opt.statuscolumn = "%l%s"
vim.opt.wrap = true
vim.g.lazyvim_eslint_auto_format = true
vim.g.root_spec = { "cwd" }
vim.opt.relativenumber = false
vim.opt.mouse = "a"
vim.opt.termguicolors = true
local os = vim.loop.os_uname().sysname
if (os == "Darwin") or (os == "Linux") then
  vim.o.shell = "fish"
else
  vim.o.shell = "nu"
  vim.o.shellcmdflag = "-c"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end
vim.o.laststatus = 3
-- vim.o.cmdheight = 2

-- Neovide settings
vim.o.guifont = "GeistMono Nerd Font:h12"
vim.g.neovide_padding_top = 40
vim.g.neovide_padding_left = 40
vim.g.neovide_padding_right = 40
vim.g.neovide_padding_bottom = 40
vim.g.neovide_floating_shadow = false
vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 1
vim.g.neovide_floating_corner_radius = 0.5
vim.g.neovide_touch_drag_timeout = 0.7
vim.opt.linespace = 0

if vim.g.neovide then
  vim.g.terminal_color_0 = "#000000"
  vim.g.terminal_color_1 = "#f38ba8"
  vim.g.terminal_color_2 = "#a6e3a1"
  vim.g.terminal_color_3 = "#f9e2af"
  vim.g.terminal_color_4 = "#89b4fa"
  vim.g.terminal_color_5 = "#f5c2e7"
  vim.g.terminal_color_6 = "#94e2d5"
  vim.g.terminal_color_7 = "#bac2de"
  vim.g.terminal_color_8 = "#585b70"
  vim.g.terminal_color_9 = "#f38ba8"
  vim.g.terminal_color_10 = "#a6e3a1"
  vim.g.terminal_color_11 = "#f9e2af"
  vim.g.terminal_color_12 = "#89b4fa"
  vim.g.terminal_color_13 = "#f5c2e7"
  vim.g.terminal_color_14 = "#94e2d5"
  vim.g.terminal_color_15 = "#a6adc8"
end
