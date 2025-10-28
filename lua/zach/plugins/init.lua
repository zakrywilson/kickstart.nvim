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
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          css = { "prettierd" },
          elixir = { "mix" },
          javascript = { "prettierd" },
          lua = { "stylua" },
          typescript = { "prettierd" },
          edn = { "zprint" },
        },
        format_on_save = {
          css = { timeout = 1000 },
          javascript = { timeout = 1000 },
          lua = { timeout = 1000 },
          typescript = { timeout = 1000 },
          edn = { timeout = 1000 },
        },
        formatters = {
          zprint = {
            command = "zprint",
            stdin = true,
          },
        },
      })
      vim.api.nvim_create_user_command("Format", function()
        require("conform").format({ async = true })
      end, { desc = "Format current buffer with conform.nvim" })
    end,
  },
  -- TODO: Replace this with our own implementation.
  {
    "nfrid/markdown-togglecheck",
    dependencies = "nfrid/treesitter-utils",
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      heading = {
        render_modes = true,
        icons = {},
      },
      code = {
        render_modes = true,
        sign = false,
        style = "full",
        language_name = false,
      },
      dash = { render_modes = true },
      bullet = { render_modes = true },
      checkbox = { render_modes = true },
      quote = {
        render_modes = true,
      },
      link = {
        enabled = false,
        render_modes = true,
        custom = {},
      },
    },
  },
  {
    dir = "~/Development/checklists.nvim",
    config = function()
      require("checklists")
    end,
  },
  {
    dir = "~/Development/tmsync/extra/nvim/tmsync.nvim",
    config = function()
      require("tmsync").setup({
        filepath = vim.fn.expand("$TMSYNC_HOME") .. "/nvim-colorscheme.vim",
      })
    end,
  },
  {
    "bakpakin/janet.vim",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "junegunn/vim-easy-align",
    lazy = true,
    keys = {
      { "ga", mode = "n" },
      { "ga", mode = "x" },
    },
    config = function()
      vim.cmd([[nmap ga <Plug>(EasyAlign)]])
      vim.cmd([[xmap ga <Plug>(EasyAlign)]])
    end,
  },
  {
    "rmagatti/auto-session",
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      -- log_level = 'debug',
    },
  },
  {
    "Olical/conjure",
    ft = { "clojure", "fennel", "janet", "racket", "scheme", "lua" },
    config = function()
      vim.g["conjure#mapping#enable_defaults"] = false

      -- Chicken
      vim.g["conjure#client#scheme#stdio#command"] = "csi -:c"
      vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "\n-#;%d-> "
      vim.g["conjure#client#scheme#stdio#value_prefix_pattern"] = false
    end,
  },
  {
    "lowitea/aw-watcher.nvim",
    event = "VeryLazy",
    opts = {},
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
        "<leader>s",
        mode = { "n", "x", "o" },
        function()
          ---@diagnostic disable-next-line: missing-fields
          require("flash").jump({
            labels = "eniumlyhkjstrfcvpwxbgqz",
            search = {
              mode = "exact",
              max_length = 2,
            },
          })
        end,
        desc = "Flash (2-char jump)",
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
            pattern = "^",
          })
        end,
        desc = "Flash down",
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
            pattern = "^",
          })
        end,
        desc = "Flash up",
      },
      { "<leader>f", false }, -- Disable this.
    },
  },

  {
    "chrisbra/Colorizer",
    keys = {
      { "<leader>tc", "<cmd>ColorToggle<cr>", desc = "[T]oggle [C]olor" },
    },
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    config = function()
      require("zach.config.luasnip")
    end,
  },

  -- example: https://codeberg.org/j4de/nvim/src/branch/master/lua/plugins/editor.lua
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      delay = 500,
      large_file_cuttoff = 2000,
      large_file_overrides = { providers = { "lsp" } },
      min_count_to_highlight = 2,
      providers = { "lsp", "treesitter", "regex" },
      under_cursor = true,
      filetypes_denylist = {
        "markdown",
        "text",
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },

  { "nvim-tree/nvim-web-devicons" },

  -- Themes
  {
    "projekt0n/github-nvim-theme",
    name = "github",
    priority = 1000,
    config = function()
      require("github-theme").setup({
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
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
      },
    },
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
      vim.cmd.colorscheme("zenbones")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
          terminal_colors = true,
          styles = {
            comments = "italic",
            keywords = "italic",
            conditionals = "italic",
            types = "italic",
            functions = "bold",
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
        term_colors = true,
        styles = {
          comments = { "italic" },
          functions = { "bold" },
          keywords = { "italic" },
        },
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
    end,
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        transparent = true,
        term_colors = true,
        code_style = {
          comments = "italic",
          functions = "bold",
          keywords = "italic",
        },
        lualine = {
          transparent = true,
        },
      })
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("kanagawa").setup({
        transparent = true,
        commentStyle = { italic = true },
        functionStyle = { bold = true },
        keywordStyle = { italic = true },
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
                float = {
                  bg = "none",
                },
              },
            },
          },
        },
        overrides = function(colors)
          return {
            -- Render Markdown plugin
            RenderMarkdownCode = { bg = colors.palette.lotusWhite2 },
            RenderMarkdownCodeInline = { bg = colors.palette.lotusWhite3 },
            RenderMarkdownH1Bg = { bg = colors.palette.lotusWhite2 },
            RenderMarkdownH2Bg = { bg = colors.palette.lotusWhite1 },
            RenderMarkdownH3Bg = { bg = colors.palette.lotusWhite0 },
            RenderMarkdownH4Bg = { bg = colors.palette.lotusWhite3 },
            RenderMarkdownH5Bg = { bg = colors.palette.lotusWhite3 },
            RenderMarkdownH6Bg = { bg = colors.palette.lotusWhite3 },
            -- Flash plugin
            FlashLabel = { fg = colors.palette.peachRed, bg = "none", bold = true },
            FlashMatch = { fg = colors.palette.lotusAqua, bg = "none", bold = true },
            FlashBackdrop = { fg = colors.palette.fujiGray, bg = "none" },
          }
        end,
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
      require("onenord").setup({
        disable = {
          background = true,
        },
        styles = {
          comments = "italic",
          keywords = "italic",
          functions = "bold",
        },
      })
    end,
  },
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {
      variant = "autumn",
      on_colors = function(colors, _)
        colors.base03 = "#112125"
        return colors
      end,
      highlights = function(colors)
        return {
          Normal = { fg = colors.base0, bg = colors.base03 },
        }
      end,
    },
    config = function(_, opts)
      vim.o.termguicolors = true
      require("solarized").setup(opts)
      vim.cmd.colorscheme("solarized")
    end,
  },
}
