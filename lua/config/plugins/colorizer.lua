return {
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup({
        filetypes = {
          "*",                          -- all files
          "!vim",                       -- except vim
          css = { css = true },         -- full CSS color support
          html = { names = true },
          javascript = { names = false },
          typescript = { names = false },
        },
        user_default_options = {
          RGB = true,         -- #RGB hex codes
          RRGGBB = true,      -- #RRGGBB hex codes
          names = true,       -- color names like "Blue"
          RRGGBBAA = true,    -- #RRGGBBAA hex codes
          AARRGGBB = false,
          rgb_fn = true,      -- CSS rgb() and rgba()
          hsl_fn = true,      -- CSS hsl() and hsla()
          css = false,
          css_fn = false,
          mode = "background", -- "background" | "foreground" | "virtualtext"
          tailwind = true,    -- Tailwind CSS color names
          virtualtext = "■",
        },
        buftypes = {},
      })
    end,
  },
}
