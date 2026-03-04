return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {
    picker = {
      files = {
        git_icons = true,
      },
    },
  },
  ---@diagnostic enable: missing-fields
}
