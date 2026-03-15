return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		ts.setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		-- Install parsers (async; already-installed are no-op)
		local parsers = {
			"vimdoc",
			"javascript",
			"typescript",
			"tsx",
			"html",
			"c",
			"lua",
			"rust",
			"jsdoc",
			"bash",
		}
		ts.install(parsers)

		-- Enable treesitter highlight + indent for these filetypes (main-branch API)
		local ft_highlight = {
			"bash",
			"c",
			"html",
			"javascript",
			"javascriptreact",
			"jsdoc",
			"lua",
			"markdown",
			"rust",
			"templ",
			"typescript",
			"typescriptreact",
			"vim",
			"vimdoc",
			"xml",
			"typst",
		}
		vim.api.nvim_create_autocmd("FileType", {
			pattern = ft_highlight,
			callback = function()
				-- Only start treesitter if parser is available (e.g. html may not be installed yet)
				local ok = pcall(vim.treesitter.start)
				if ok then
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})

		-- Markdown: also use regex highlighting together with treesitter
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				vim.bo.syntax = "markdown"
			end,
		})

		-- Custom parser: templ
		vim.api.nvim_create_autocmd("User", {
			pattern = "TSUpdate",
			callback = function()
				local parsers_table = require("nvim-treesitter.parsers")
				parsers_table.templ = {
					install_info = {
						url = "https://github.com/vrischmann/tree-sitter-templ.git",
						files = { "src/parser.c", "src/scanner.c" },
						branch = "master",
					},
				}
			end,
		})
		vim.treesitter.language.register("templ", "templ")
	end,
}
