return {
  -- cmp-latex-symbols removed: it requires nvim-cmp (require "cmp"), not blink.cmp.
  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
    version = "1.*",
    ---@module 'blink.cmp'
    opts = {
      keymap = {
        ["<Tab>"]   = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<CR>"]    = { "select_and_accept", "fallback" },
        ["<C-e>"]   = { "hide", "fallback" },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      signature = {
        enabled = true,
        window = {
          show_documentation = false,
          border = "rounded",
        },
      },
      completion = {
        trigger = {
          show_on_insert_on_trigger_character = false,
          show_on_accept_on_trigger_character = false,
          show_on_blocked_trigger_characters = { "{", "(", "}", ")" },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
          window = { border = "rounded" },
        },
        menu = {
          auto_show = true,
          scrollbar = false,
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind", gap = 1 },
              { "source_name", gap = 1 },
            },
            components = {
              kind_icon = {
                ellipsis = false,
                width = { fill = true },
                text = function(ctx)
                  local kind_icons = {
                    Function    = "λ",
                    Method      = "∂",
                    Field       = "󰀫",
                    Variable    = "󰀫",
                    Property    = "󰀫",
                    Keyword     = "k",
                    Struct      = "Π",
                    Enum        = "τ",
                    EnumMember  = "τ",
                    Snippet     = "⊂",
                    Text        = "τ",
                    Module      = "⌠",
                    Constructor = "∑",
                  }
                  return kind_icons[ctx.kind] or ctx.kind_icon
                end,
              },
            },
          },
        },
      },
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "lua" },
    },
    opts_extend = { "sources.default" },
  },
}
