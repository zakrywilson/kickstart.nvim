return {
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
      local leap = require('leap')
      leap.opts.safe_labels = 'stnuf'
      leap.opts.labels = 'neioumhtsrafvdjkqgzbNEIOUMHTSRAFVDJ;K/QGZB'
    end,
  },

  {
    "chrisbra/Colorizer",
    keys = {
      { "<leader>cc", "<cmd>ColorToggle<cr>", desc = "Toggle Colorizer" },
    },
  },

  -- example: https://codeberg.org/j4de/nvim/src/branch/master/lua/plugins/editor.lua
  {
    'RRethy/vim-illuminate',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      delay = 500,
      large_file_cuttoff = 2000,
      large_file_overrides = { providers = { 'lsp' } },
      min_count_to_highlight = 2,
      providers = { 'lsp', 'treesitter', 'regex' },
      under_cursor = true,
    },
    config = function(_, opts)
      require('illuminate').configure(opts)
    end,
  },

  -- Themes
  { "projekt0n/github-nvim-theme" },
  { "savq/melange-nvim" },
  { 'rose-pine/neovim', name = 'rose-pine' },
  { "jacksonludwig/vim-earl-grey" },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            comments = 'italic', -- change style of comments to be italic
          },
          inverse = {
            match_paren = true, -- inverse the highlighting of match_parens
          },
        },
      })
    end,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({})
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_background = 'soft'
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_visual = 'red background'
      vim.g.gruvbox_material_palette = 'material'
    end
  },
}
