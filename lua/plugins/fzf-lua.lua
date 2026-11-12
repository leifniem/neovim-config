return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {
    files = {
      git_icons = true,
    },
    previewers = {
      builtin = {
        syntax_limit_b = 256 * 1024,
      },
    },
  },
  ---@diagnostic enable: missing-fields
}
