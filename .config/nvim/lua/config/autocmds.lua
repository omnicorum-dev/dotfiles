local group = vim.api.nvim_create_augroup("config", { clear = true })
-- An augroup with clear = true means re-sourcing this file replaces the
-- autocmds instead of stacking duplicates.

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Reopen files at the last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
	group = group,
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local lines = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= lines then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Equalize splits when the terminal is resized
vim.api.nvim_create_autocmd("VimResized", {
	group = group,
	command = "wincmd =",
})

-- Close help/quickfix/etc. with q
vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = { "help", "qf", "checkhealth", "man", "nvim-undotree" },
	callback = function(args)
		vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = args.buf })
	end,
})
