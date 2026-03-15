-- lua/plugins/terminal.lua

-- 1. Set Terminal-specific behavior
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.scrolloff = 0
		vim.bo.filetype = "terminal"

		-- Optional: Automatically start in insert mode when opening
		vim.cmd("startinsert")
	end,
})

-- 2. Escape terminal mode with double Esc
vim.keymap.set("t", "<esc><esc>", [[<c-\><c-n>]], { desc = "Exit terminal mode" })

-- 3. The New Keymap: <Leader> + `
-- Note: Replace "<leader>`" with "`" if you want it to be just the backtick.
vim.keymap.set("n", "<leader>`", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 12)
	vim.wo.winfixheight = true
	vim.cmd.term()
end, { desc = "Open terminal at bottom" })

-- Move between splits using Ctrl + h/j/k/l
-- These work in Normal mode
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- These work while you are typing inside the Terminal (Terminal mode)
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]])
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]])
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]])
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]])

return {}
