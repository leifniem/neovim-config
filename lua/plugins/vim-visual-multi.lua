return {
  "mg979/vim-visual-multi",
  branch = "master",
  enabled = false,
  init = function()
    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>",
    }
  end,
}
