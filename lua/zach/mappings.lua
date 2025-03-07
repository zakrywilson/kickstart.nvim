-- Esc disables highlighting
vim.keymap.set("n", "<Esc>", "<Cmd>noh<CR>", { desc = "Disable highlight" })

-- Select all
vim.keymap.set("n", "<Leader>a", "<Esc>GVgg", { noremap = true, silent = true, desc = "Select [A]ll" })

-- Save
vim.keymap.set("n", "<C-s>", "<Cmd>w<CR>", { noremap = true, silent = true, desc = "[S]ave" })
vim.keymap.set("i", "<C-s>", "<Esc><Cmd>w<CR>", { noremap = true, silent = true })

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<Leader>y", [["+y]], { silent = true, desc = "[Y]ank entire line (system clipboard)" }) -- entire line
vim.keymap.set("n", "<Leader>Y", [[v$h"+y]], { silent = true, desc = "[Y]ank to EOL (system clipboard)" }) -- to end of line (normal)
vim.keymap.set("v", "<Leader>Y", [[$h"+y]], { silent = true, desc = "[Y]ank to EOL (system clipboard)" }) -- to end of line (visual)

-- Paste without overwriting register 0
vim.keymap.set("x", "<Leader>p", [["_dP]], { desc = "[P]aste w/o overwriting register 0" })

-- Delete without overwriting register
vim.keymap.set({ "n", "v" }, "<Leader>d", [["_d]], { desc = "[D]elete w/o overwriting register" })

-- Telescope + Grep in buffer
vim.keymap.set(
  { "n", "v" },
  "<Leader>sgb",
  "<Cmd>Telescope current_buffer_fuzzy_find<CR>",
  { desc = "[S]earch [G]reg [B]uffer" }
)

-- Search in current working directory
vim.keymap.set(
  { "n", "v" },
  "<leader>s.",
  [[<Cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') })<CR>]],
  { noremap = true, silent = true, desc = "[S]earch in [.]" }
)

-- Netrw
vim.keymap.set("n", "<Leader>se", "<Cmd>Explore<CR>", { noremap = true, silent = true, desc = "[E]xplore" })

-- Open current file in Finder.
function OpenInFinder()
  local current_path = vim.fn.expand("%:p")
  if current_path == "" then
    current_path = vim.fn.getcwd()
  end
  local escaped_path = vim.fn.shellescape(current_path)
  vim.fn.system("open -R " .. escaped_path)
end
vim.api.nvim_set_keymap(
  "n",
  "<Leader>of",
  ":lua OpenInFinder()<CR>",
  { noremap = true, silent = true, desc = "[O]pen in [F]inder" }
)
