vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require("gitsigns").setup({
	on_attach = function(buf)
		local gs = require("gitsigns")
		local function map(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
		end
		map("]h", function()
			gs.nav_hunk("next")
		end, "Next hunk")
		map("[h", function()
			gs.nav_hunk("prev")
		end, "Prev hunk")
		map("<leader>ghs", gs.stage_hunk, "Stage hunk")
		map("<leader>ghr", gs.reset_hunk, "Reset hunk")
		map("<leader>ghp", gs.preview_hunk, "Preview hunk")
		map("<leader>ghb", gs.blame_line, "Blame line")
	end,
})

vim.keymap.set("n", "<leader>gg", function()
	if vim.fn.executable("lazygit") == 0 then
		return vim.notify("lazygit not found on PATH", vim.log.levels.ERROR)
	end

	-- A throwaway buffer in a centered floating window, 90% of the screen
	local buf = vim.api.nvim_create_buf(false, true)
	local width = math.floor(vim.o.columns * 0.9)
	local height = math.floor(vim.o.lines * 0.9)
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2 - 2),
		col = math.floor((vim.o.columns - width) / 2),
		style = "minimal",
	})

	-- Run lazygit as a terminal inside that buffer
	vim.fn.jobstart("lazygit", {
		term = true,
		on_exit = function()
			if vim.api.nvim_win_is_valid(win) then
				vim.api.nvim_win_close(win, true)
			end
			if vim.api.nvim_buf_is_valid(buf) then
				vim.api.nvim_buf_delete(buf, { force = true })
			end
			vim.cmd("checktime") -- reload buffers lazygit may have changed (checkout, stash, etc.)
		end,
	})

	-- Let Esc reach lazygit instead of the global "exit terminal mode" mapping
	vim.keymap.set("t", "<Esc>", "<Esc>", { buffer = buf, nowait = true })

	vim.cmd.startinsert() -- start in terminal mode so keys go straight to lazygit
end, { desc = "Lazygit" })
