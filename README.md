# 🌸 NvimRose

> A handcrafted Neovim configuration built on **Rose Pine** — minimal, fast, and opinionated.

---

## ✨ Features

| Category | Plugin / Tool |
|---|---|
| 🎨 Theme | Rose Pine (main variant) |
| 🌳 Syntax | nvim-treesitter `v0.9.3` |
| 🧠 LSP | nvim-lspconfig + Mason (nvim 0.11 API) |
| ✅ Completion | blink.cmp + LuaSnip |
| 🗂 File Explorer | Neo-tree |
| 📊 Status Line | Lualine |
| 🎯 Formatting | conform.nvim |
| 🌈 Color Preview | nvim-colorizer |
| 🏷 Auto Tags | nvim-ts-autotag |
| 🔍 Fuzzy Finder | Telescope |
| 🚨 Diagnostics | Trouble.nvim |
| 📄 Documents | Typst + tinymist LSP |
| 🖼 Icons | nvim-web-devicons |

---

## 📋 Requirements

Before installing, make sure you have:

```bash
# Neovim 0.11+
nvim --version

# Node.js v18+ (for LSPs)
node --version

# A C compiler (for Treesitter)
gcc --version    # or clang --version

# ripgrep (for Telescope live grep)
rg --version

# Typst (for .typ document support)
typst --version
```

### Nerd Font

Icons require a **Nerd Font** in your terminal. Recommended: [GeistMono Nerd Font](https://www.nerdfonts.com/font-downloads)

---

## 🚀 Installation

### Step 1 — Clean old config

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

### Step 2 — Clone this config

```bash
git clone https://github.com/aniketmahajan04/new-nvim-setup ~/.config/nvim
```

### Step 3 — First launch

```bash
nvim
```

On first open, **lazy.nvim** will auto-bootstrap and install all plugins. Wait for it to finish, then run:

```vim
:Lazy sync
:MasonUpdate
:TSUpdate
:MasonToolsInstall
```

---

## 📁 Structure

```
~/.config/nvim/
├── init.lua                        ← entry point
└── lua/
    └── config/
        ├── lazy.lua                ← plugin manager bootstrap
        ├── options.lua             ← vim options
        ├── keymaps.lua             ← keybindings
        └── plugins/
            ├── ui.lua              ← Rose Pine, devicons, telescope, autopairs
            ├── treesitter.lua      ← syntax highlighting & textobjects
            ├── lsp.lua             ← Mason + LSP servers
            ├── completion.lua      ← blink.cmp + LuaSnip
            ├── conform.lua         ← formatters (prettier, stylua, clang-format)
            ├── neo-tree.lua        ← file explorer
            ├── lualine.lua         ← statusline
            ├── colorizer.lua       ← inline color preview
            ├── autotag.lua         ← HTML/JSX auto tag close & rename
            ├── trouble.lua         ← diagnostics panel
            └── typst.lua           ← Typst document support
```

---

## 🧠 LSP Servers

Installed automatically via **Mason**:

| Language | Server |
|---|---|
| C / C++ | `clangd` |
| JavaScript / TypeScript | `ts_ls` |
| Markdown | `marksman` |
| Lua | `lua_ls` |
| CSS | `cssls` |
| HTML | `html` |
| JSON | `jsonls` |
| Typst | `tinymist` |

---

## 🎯 Formatters

Installed automatically via **mason-tool-installer**:

| Language | Formatter |
|---|---|
| C / C++ | `clang-format` |
| JS / TS / HTML / CSS / JSON / YAML / Markdown | `prettier` |
| Lua | `stylua` |
| Typst | `tinymist` |

---

## ⌨️ Keybindings

> Leader key is `<Space>`

### General

| Key | Action |
|---|---|
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `jk` | Exit insert mode |
| `<Esc>` | Clear search highlight |
| `<Tab>` / `<S-Tab>` | Next / Prev buffer |
| `<leader>bd` | Delete buffer |
| `<C-h/j/k/l>` | Navigate between windows |

### File Explorer

| Key | Action |
|---|---|
| `<leader>e` | Toggle Neo-tree |
| `<leader>o` | Focus Neo-tree |

### Telescope

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>fr` | Recent files |
| `<leader>fh` | Help tags |

### LSP

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gr` | References |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>D` | Type definition |
| `<leader>d` | Show diagnostic float |
| `[d` / `]d` | Prev / Next diagnostic |

### Diagnostics & Trouble

| Key | Action |
|---|---|
| `<leader>xx` | All project diagnostics |
| `<leader>xb` | Current buffer diagnostics |
| `<leader>xl` | LSP definitions & references |
| `<leader>xq` | Quickfix list |

### Formatting

| Key | Action |
|---|---|
| `<leader>fm` | Format current file |

### Typst

| Key | Action |
|---|---|
| `<leader>tp` | Start live preview in browser |
| `<leader>ts` | Stop live preview |
| `<leader>tt` | Toggle live preview |

### Completion (blink.cmp)

| Key | Action |
|---|---|
| `<Tab>` | Next item / snippet forward |
| `<S-Tab>` | Prev item / snippet backward |
| `<CR>` | Accept completion |
| `<C-e>` | Dismiss completion |

---

## 🌸 Theme

Uses **Rose Pine** (`main` variant) throughout — including Lualine, Telescope, and floating windows.

To switch variants, edit `lua/config/plugins/ui.lua`:

```lua
require("rose-pine").setup({
  variant = "main",   -- "main" | "moon" | "dawn"
})
```

---

## 📄 Typst Support

Write beautiful documents with `.typ` files:

```typst
#set document(title: "My Doc")
#set page(paper: "a4")

= Heading

Some *bold* and _italic_ text.

$ E = m c^2 $

#figure(
  image("photo.jpg", width: 70%),
  caption: [A caption],
)
```

- **LSP**: autocomplete, error checking, hover docs via `tinymist`
- **Live preview**: opens in browser with `<leader>tp`, hot-reloads on save
- **PDF export**: auto-exported to same folder on save

---

## 🔧 Updating

```vim
" Update all plugins
:Lazy sync

" Update LSP servers
:MasonUpdate

" Update Treesitter parsers
:TSUpdate
```

---

## 💡 Tips

- Diagnostic float **auto-appears** after 300ms when cursor rests on an error
- `nvim-colorizer` previews hex colors, RGB, HSL, and Tailwind class colors inline
- `nvim-ts-autotag` auto-closes and renames HTML/JSX tags
- Line wrapping is **visual only** — long lines wrap at display width without changing the file

---

<div align="center">
  <sub>Built with 🌸 and Lua</sub>
</div>
