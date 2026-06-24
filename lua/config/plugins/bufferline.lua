-- return {}
return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					themable = true,
					numbers = "none",
					close_command = "bdelete! %d",
					right_mouse_command = "bdelete! %d",
					left_mouse_command = "buffer %d",
					indicator = {
						icon = "▎",
						style = "icon",
					},
					buffer_close_icon = "󰅖",
					modified_icon = "●",
					close_icon = "",
					left_trunc_marker = "",
					right_trunc_marker = "",
					diagnostics = "nvim_lsp", -- shows error/warn count on tab
					diagnostics_indicator = function(count, level)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end,
					offsets = {
						{
							filetype = "neo-tree",
							text = "  File Explorer",
							text_align = "left",
							separator = true,
						},
					},
					color_icons = true,
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					show_close_icon = true,
					show_tab_indicators = true,
					persist_buffer_sort = true,
					separator_style = "thick", -- "slant" | "slope" | "thick" | "thin"
					enforce_regular_tabs = false,
					always_show_bufferline = true,
					hover = {
						enabled = true,
						delay = 150,
						reveal = { "close" },
					},
				},
				highlights = require("rose-pine.plugins.bufferline"),
			})
		end,
	},
}
