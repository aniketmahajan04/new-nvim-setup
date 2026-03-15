return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		local function clock()
			return os.date("  %H:%M")
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
				disabled_filetypes = { "dashboard", "lazy", "neo-tree" },
			},

			sections = {
				lualine_a = {
					{ "mode", icon = "" },
				},
				lualine_b = {
					{ "branch", icon = "" },
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = { modified = " ●", readonly = " " },
					},

					-- ⭐ Diagnostics Section Added
					{
						"diagnostics",
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = "󰌵 ",
						},
						colored = true,
						always_visible = false,
					},
				},

				lualine_x = {
					{ "filetype", icon_only = true },
					{
						function()
							local enc = vim.o.fileencoding ~= "" and vim.o.fileencoding or "none"
							return " " .. enc
						end,
					},
					{ "filesize" },
				},

				lualine_y = {
					{ "progress" },
					{ clock },
				},

				lualine_z = {
					{ "location" },
				},
			},
		})
	end,
}
