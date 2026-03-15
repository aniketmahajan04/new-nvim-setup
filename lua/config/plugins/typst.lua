return {
	-- Typst syntax + utilities
	{
		"kaarmu/typst.vim",
		ft = "typst",
	},

	-- Typst LSP (tinymist)
	{
		"neovim/nvim-lspconfig",
		ft = "typst",
		config = function()
			vim.lsp.config("tinymist", {
				capabilities = vim.lsp.protocol.make_client_capabilities(),
				settings = {
					tinymist = {
						exportPdf = "onSave", -- auto export to PDF on save
						outputPath = "$dir/$name", -- same folder as .typ file
					},
				},
			})
			vim.lsp.enable("tinymist")
		end,
	},

	-- Typst preview in browser (live reload)
	{
		"chomosuke/typst-preview.nvim",
		ft = "typst",
		version = "1.*",
		build = function()
			require("typst-preview").update()
		end,
		opts = {
			open_cmd = "xdg-open %s", -- Linux; change to "open %s" on macOS
		},
		keys = {
			{ "<leader>tp", "<cmd>TypstPreview<cr>", desc = "Typst Preview" },
			{ "<leader>ts", "<cmd>TypstPreviewStop<cr>", desc = "Typst Preview Stop" },
			{ "<leader>tt", "<cmd>TypstPreviewToggle<cr>", desc = "Typst Preview Toggle" },
		},
	},
}
