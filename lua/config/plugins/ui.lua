return {
  -- Rose Pine theme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "main",         -- "main" | "moon" | "dawn"
        dark_variant = "main",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },
        highlight_groups = {
          TelescopeBorder = { fg = "overlay", bg = "overlay" },
          TelescopeNormal = { bg = "overlay" },
          TelescopeSelection = { fg = "text", bg = "highlight_med" },
        },
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },

  -- Web devicons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("nvim-web-devicons").setup({
        default = true,
      })
    end,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPost",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope = { enabled = true },
      })
    end,
  },

  -- Which-key (shows keybindings popup)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({})
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_prefix = "  ",
          selection_caret = " ",
          path_display = { "truncate" },
          -- Use regex/syntax highlighting in preview; avoids nvim-treesitter API mismatch (ft_to_lang)
          preview = {
            treesitter = { enable = false },
          },
        },
      })
    end,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({ check_ts = true })
    end,
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "▎" },
        },
      })
    end,
  },
}
