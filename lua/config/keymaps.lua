-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- Resize also in terminal mode, so it works inside sidekick panels where you
-- are in terminal-insert and normal-mode maps never fire.
for lhs, cmd in pairs({
  ["<C-Left>"] = "vertical resize -2",
  ["<C-Right>"] = "vertical resize +2",
  ["<C-Up>"] = "resize +2",
  ["<C-Down>"] = "resize -2",
}) do
  map("t", lhs, "<C-\\><C-n><cmd>" .. cmd .. "<cr><cmd>startinsert<cr>", { desc = "Resize Window" })
end
map("i", ";;", "<C-o>")

-- git jump -> fzf-lua / quickfix. Plain `git jump` spawns `$EDITOR -q`, which
-- nests a second nvim, so use --stdout and parse it here.
--
-- Output shape differs per mode: diff and grep emit "file:lnum:col: text",
-- merge and ws emit "file:lnum: text". Parsed by hand rather than fed to
-- 'errorformat' so both shapes land the same way, and so ws mode's second
-- line per error (the raw offending text, e.g. "+trail") is dropped instead
-- of becoming a bogus entry.
local function git_jump_items(args)
  local out = vim.fn.systemlist("git jump --stdout " .. args)
  if vim.v.shell_error ~= 0 then
    vim.notify(table.concat(out, "\n"), vim.log.levels.ERROR, { title = "git jump" })
    return {}
  end
  local items = {}
  for _, line in ipairs(out) do
    local file, lnum, rest = line:match("^(.-):(%d+):(.*)$")
    -- Older git emitted /dev/null for deletions; harmless to keep filtering.
    if file and file ~= "" and not file:match("^/dev/null") then
      local col, text = rest:match("^(%d+):%s*(.*)$")
      items[#items + 1] = {
        filename = file,
        lnum = tonumber(lnum),
        col = tonumber(col) or 1,
        text = text or vim.trim(rest),
      }
    end
  end
  return items
end

vim.api.nvim_create_user_command("GitJump", function(opts)
  local items = git_jump_items(opts.args)
  if #items == 0 then
    return vim.notify("no results: git jump " .. opts.args, vim.log.levels.WARN)
  end

  local ok, fzf = pcall(require, "fzf-lua")
  if opts.bang or not ok then
    vim.fn.setqflist({}, " ", { title = "git jump " .. opts.args, items = items })
    return vim.cmd("botright copen")
  end

  -- fzf-lua reads location back out of the entry string, so re-emit the
  -- canonical file:lnum:col:text that its file actions and previewer expect.
  fzf.fzf_exec(vim.tbl_map(function(i)
    return ("%s:%d:%d:%s"):format(i.filename, i.lnum, i.col, i.text)
  end, items), {
    prompt = "git jump " .. opts.args .. "> ",
    previewer = true,
    actions = fzf.defaults.actions.files,
  })
end, {
  nargs = "+",
  bang = true,
  complete = function()
    return { "diff", "merge", "grep", "ws", "auto" }
  end,
  desc = "git jump <mode> -> fzf (bang: quickfix)",
})

map("n", "<leader>gj", "<cmd>GitJump diff<cr>", { desc = "Git Jump (diff hunks, fzf)" })
map("n", "<leader>gJ", "<cmd>GitJump! diff<cr>", { desc = "Git Jump (diff hunks, quickfix)" })
