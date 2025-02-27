vim.o.hlsearch = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- Undo and Swap file
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("config") .. "/undo"
vim.o.directory = vim.fn.stdpath("config") .. "/swap"

-- Spell file
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
