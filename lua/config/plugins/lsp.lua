return {
	-- Mason: LSP installer
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	-- Mason-lspconfig bridge
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"ts_ls",
					"marksman",
					"lua_ls",
					"cssls",
					"html",
					"jsonls",
				},
				automatic_installation = true,
			})
		end,
	},

	-- LSP config
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- LSP capabilities (no nvim-cmp; compatible with blink.cmp)
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem = {
				snippetSupport = true,
				resolveSupport = {
					properties = { "documentation", "detail", "additionalTextEdits" },
				},
			}

			-- Diagnostics signs
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

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

			-- on_attach via autocmd (new 0.11 style)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					map("gd", vim.lsp.buf.definition, "Go to Definition")
					map("gr", vim.lsp.buf.references, "References")
					map("gi", vim.lsp.buf.implementation, "Go to Implementation")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("<leader>rn", vim.lsp.buf.rename, "Rename")
					map("<leader>D", vim.lsp.buf.type_definition, "Type Definition")
				end,
			})

			-- New vim.lsp.config API (nvim 0.11+)
			vim.lsp.config("clangd", { capabilities = capabilities })
			vim.lsp.config("ts_ls", { capabilities = capabilities })
			vim.lsp.config("marksman", { capabilities = capabilities })
			vim.lsp.config("cssls", { capabilities = capabilities })
			vim.lsp.config("html", { capabilities = capabilities })
			vim.lsp.config("jsonls", { capabilities = capabilities })
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			})

			-- Enable all configured servers
			vim.lsp.enable({
				"clangd",
				"ts_ls",
				"marksman",
				"cssls",
				"html",
				"jsonls",
				"lua_ls",
			})
		end,
	},
}
