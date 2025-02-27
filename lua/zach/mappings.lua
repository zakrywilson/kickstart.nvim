-- Esc disables highlighting
vim.keymap.set('n', '<Esc>', '<Cmd>noh<CR>')

-- Select all
vim.keymap.set('n', '<Leader>a', '<Esc>GVgg', { noremap = true, silent = true })

-- Save
vim.keymap.set('n', "<C-s>", "<Cmd>w<CR>", { noremap = true, silent = true })

-- Copy to system clipboard
vim.keymap.set({ 'n', 'v' }, "<Leader>y", [["+y]], { silent = true }) -- entire line
vim.keymap.set('n', "<Leader>Y", [[v$h"+y]], { silent = true })       -- to end of line (normal)
vim.keymap.set('v', "<Leader>Y", [[$h"+y]], { silent = true })        -- to end of line (visual)

-- Paste without overwriting register 0
vim.keymap.set('x', "<Leader>p", [["_dP]])

-- Delete without overwriting register
vim.keymap.set({ 'n', 'v' }, '<Leader>d', [["_d]])

-- Netrw
vim.keymap.set('n', '<Leader>se', '<Cmd>Explore<CR>', { noremap = true, silent = true })

-- Open current file in Finder.
function OpenInFinder()
    local current_path = vim.fn.expand('%:p')
    if current_path == "" then
        current_path = vim.fn.getcwd()
    end
    local escaped_path = vim.fn.shellescape(current_path)
    vim.fn.system('open -R ' .. escaped_path)
end
vim.api.nvim_set_keymap('n', '<Leader>of', ':lua OpenInFinder()<CR>', { noremap = true, silent = true })
