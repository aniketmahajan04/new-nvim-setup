return {
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- auto close tags
					enable_rename = true, -- auto rename pairs of tags
					enable_close_on_slash = true, -- auto close on </
				},
				per_filetype = {
					["html"] = { enable_close = true },
					["javascript"] = { enable_close = true },
					["typescript"] = { enable_close = true },
					["tsx"] = { enable_close = true },
					["javascriptreact"] = { enable_close = true },
					["typescriptreact"] = { enable_close = true },
					["markdown"] = { enable_close = false },
				},
			})
		end,
	},
}
