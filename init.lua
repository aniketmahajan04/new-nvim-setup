require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.plugins.terminal")

vim.opt.laststatus = 0
vim.opt.cmdheight = 1

vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
					source = "if_many",
				},
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					focusable = true,
					border = "rounded",
					source = true,
					header = "",
					prefix = "",
				},
			})