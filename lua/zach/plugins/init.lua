return {
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({})

      -- Format on save
      local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
         require('go.format').goimport()
        end,
        group = format_sync_grp,
      })
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function()
          require("flash").jump({
            labels = "eniumlyhkjstrfcvpwxbgqz",
          })
        end,
        desc = "Flash" },
      { "<leader>j", mode = { "n" , "x", "o" }, function()
          require("flash").jump({
            labels = "strcfavxpwqgbzeniumyljk",
            search = { mode = "search", forward = true, max_length = 0, wrap = false, multi_window = false },
            label = { after = { 0, 0 } },
            pattern = "^"
          })
        end, desc = "Flash down"},
      { "<leader>k", mode = { "n", "x", "o" }, function()
          require("flash").jump({
            labels = "strcfavxpwqgbzeniumyljk",
            search = { mode = "search", forward = false, max_length = 0, wrap = false, multi_window = false },
            label = { after = { 0, 0 } },
            pattern = "^"
          })
        end, desc = "Flash up"},
    },
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

  { 'nvim-tree/nvim-web-devicons' },

  -- Themes
  {
    "projekt0n/github-nvim-theme",
    name = "github",
    priority = 1000,
  },
  {
    "savq/melange-nvim",
    name = "melange",
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
  },
  {
    "jacksonludwig/vim-earl-grey",
    name = "vim-earl-grey",
    priority = 1000,
  },
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            comments = "italic", -- change style of comments to be italic
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
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "soft"
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_visual = "red background"
      vim.g.gruvbox_material_palette = "material"
    end
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
  },
}