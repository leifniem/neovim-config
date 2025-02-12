return {
  "mg979/vim-visual-multi",
  branch = "master",
  enabled = true,
  init = function()
    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>",
    }
  end,
}
