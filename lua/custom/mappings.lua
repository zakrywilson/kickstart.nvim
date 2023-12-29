-- Select all
vim.keymap.set('n', '<leader>a', '<esc>GVgg', { noremap = true, silent = true })

-- Save
vim.keymap.set('n', "<C-s>", "<cmd>w<cr>", { noremap = true, silent = true })

-- Copy to system clipboard
vim.keymap.set({'n', 'v'}, "<leader>y", '"+y', { silent = true }) -- entire line
vim.keymap.set('n', "<leader>Y", 'v$h"+y', { silent = true })     -- to end of line (normal)
vim.keymap.set('v', "<leader>Y", '$h"+y', { silent = true })      -- to end of line (visual)
