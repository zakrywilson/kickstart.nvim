return {
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({})
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "Olical/conjure",
    config = function()
      vim.g["conjure#mapping#enable_defaults"] = false
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          ---@diagnostic disable-next-line: missing-fields
          require("flash").jump({
            labels = "eniumlyhkjstrfcvpwxbgqz",
          })
        end,
        desc = "Flash"
      },
      {
        "<leader>j",
        mode = { "n", "x", "o" },
        function()
          ---@diagnostic disable-next-line: missing-fields
          require("flash").jump({
            labels = "strcfavxpwqgbzeniumyljk",
            search = { mode = "search", forward = true, max_length = 0, wrap = false, multi_window = false },
            label = { after = { 0, 0 } },
            pattern = "^"
          })
        end,
        desc = "Flash down"
      },
      {
        "<leader>k",
        mode = { "n", "x", "o" },
        function()
          ---@diagnostic disable-next-line: missing-fields
          require("flash").jump({
            labels = "strcfavxpwqgbzeniumyljk",
            search = { mode = "search", forward = false, max_length = 0, wrap = false, multi_window = false },
            label = { after = { 0, 0 } },
            pattern = "^"
          })
        end,
        desc = "Flash up"
      },
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
    config = function()
      require('github-theme').setup({
        options = {
          transparent = true,
        },
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("rose-pine").setup({
        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      })
    end,
  },
  {
    "jacksonludwig/vim-earl-grey",
    name = "vim-earl-grey",
    priority = 1000,
  },
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    config = function()
      vim.g.zenbones_darken_comments = 45
      vim.g.zenwritten_transparent_background = true
      vim.g.neobones_transparent_background = true
      vim.g.vimbones_transparent_background = true
      vim.g.rosebones_transparent_background = true
      vim.g.forestbones_transparent_background = true
      vim.g.nordbones_transparent_background = true
      vim.g.tokyobones_transparent_background = true
      vim.g.seoulbones_transparent_background = true
      vim.g.duckbones_transparent_background = true
      vim.g.zenburned_transparent_background = true
      vim.g.kanagawabones_transparent_background = true
      vim.g.randombones_transparent_background = true
      vim.cmd.colorscheme('zenbones')
    end
  },
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
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
      require("everforest").setup({
        background = "medium",
        transparent_background_level = 2,
        italics = true,
        disable_italic_comments = false,
        sign_column_background = "none",
        ui_contrast = "low",
        dim_inactive_windows = false,
        diagnostic_text_highlight = false,
        diagnostic_virtual_text = "coloured",
        diagnostic_line_highlight = false,
        spell_foreground = false,
        show_eob = true,
        float_style = "bright",
        inlay_hints_background = "none",
        on_highlights = function(_, _) end,
        colours_override = function(_) end,
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
      })
    end,
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
      vim.g.gruvbox_material_transparent_background = 1
    end
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        transparent = true,
        term_colors = true,
        code_style = {
          comments  = 'italic',
          functions = 'bold',
        },
        lualine = {
          transparent = true,
        },
      })
    end,
  },
  {
    "RRethy/base16-nvim",
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        transparent = true,
        colors = {
          palette = {
            lotusWhite0 = "#e8e5d8",
            lotusWhite1 = "#f0ede3",
            lotusWhite2 = "#f5f3ec",
            lotusWhite3 = "#faf9f5",
            lotusWhite4 = "#f3f0e4",
            lotusWhite5 = "#efe9d6",
          },
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              }
            },
          }
        }
      })
    end,
  },
  {
    "cocopon/iceberg.vim",
    priority = 1000,
  },
  {
    "rmehri01/onenord.nvim",
    priority = 1000,
    config = function()
      require('onenord').setup({
        disable = {
          background = true,
        },
      })
    end,
  },
}
