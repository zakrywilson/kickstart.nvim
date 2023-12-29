-- vim-illuminate.lua
-- (https://github.com/RRethy/vim-illuminate)
-- example config: https://codeberg.org/j4de/nvim/src/branch/master/lua/plugins/editor.lua
return {
  'RRethy/vim-illuminate',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    delay = 500,
    large_file_cuttoff = 2000,
    large_file_overrides = { providers = { 'lsp' } },
    min_count_to_highlight = 2,
    providers = { 'lsp', 'treesitter', 'regex' },
    under_cursor = false,
  },
  config = function(_, opts)
    require('illuminate').configure(opts)
  end,
}
