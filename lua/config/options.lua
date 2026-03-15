local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.colorcolumn = "100"
-- GUI font (terminal Neovim ignores this; set your terminal emulator font there)
opt.guifont = "GeistMono Nerd Font:h14"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Files
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undodir")

-- Performance
opt.updatetime = 100
opt.timeoutlen = 300

-- Clipboard
opt.clipboard = "unnamedplus"

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Mouse
opt.mouse = "a"

-- hide status Line
opt.laststatus = 0
opt.cmdheight = 1

-- Wrap long lines visually (doesn't change the actual file)
opt.wrap = true
opt.linebreak = true -- break at word boundaries, not mid-word
opt.breakindent = true -- wrapped lines keep the same indentation
opt.showbreak = "↪ " -- shows this symbol at the start of wrapped lines
