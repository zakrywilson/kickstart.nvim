-- Fixes background color issues
vim.cmd([[ set t_RB= ]])

-- Fixes Tmux background color issues
vim.cmd([[
  if exists('$TMUX')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  endif
]])

-- vim.cmd([[ highlight Comment cterm=italic gui=italic ]])

-- TODO: Add flags for default values
require('zach.tmsync')
