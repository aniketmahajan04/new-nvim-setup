return {
	"goolord/alpha-nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Remove the complex highlight configuration
		dashboard.section.header.opts.hl = "Type"

		-- Replace with "Sendo" ASCII art
		dashboard.section.header.val = {
			[[                                                    ]],
			[[  ███████╗███████╗███╗   ██╗██████╗  ██████╗      ]],
			[[  ██╔════╝██╔════╝████╗  ██║██╔══██╗██╔═══██╗     ]],
			[[  ███████╗█████╗  ██╔██╗ ██║██║  ██║██║   ██║     ]],
			[[  ╚════██║██╔══╝  ██║╚██╗██║██║  ██║██║   ██║     ]],
			[[  ███████║███████╗██║ ╚████║██████╔╝╚██████╔╝     ]],
			[[  ╚══════╝╚══════╝╚═╝  ╚═══╝╚═════╝  ╚═════╝      ]],
		}

		dashboard.section.buttons.val = {
			-- dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("b", "λ  > Browse files", ":Yazi<CR>"),
			dashboard.button("z", "λ  > Browse Directories", ":Telescope zoxide list<CR>"),
			dashboard.button("f", "λ  > Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "λ  > Recent", ":Telescope oldfiles<CR>"),
		}

		alpha.setup(dashboard.opts)
	end,
}
