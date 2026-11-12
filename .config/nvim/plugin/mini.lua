vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.ai").setup() -- better text objects: cif, daa, vi(, etc.
require("mini.pairs").setup() -- auto-close brackets and quotes
require("mini.statusline").setup()

-- LazyVim's surround mappings (mini's defaults are sa/sd/sr)
require("mini.surround").setup({
	mappings = {
		add = "gsa",
		delete = "gsd",
		find = "gsf",
		find_left = "gsF",
		highlight = "gsh",
		replace = "gsr",
		update_n_lines = "gsn",
	},
})

-- File explorer you edit like a buffer
require("mini.files").setup()
vim.keymap.set("n", "<leader>e", function()
	local path = vim.api.nvim_buf_get_name(0)
	require("mini.files").open(path ~= "" and path or nil)
end, { desc = "File explorer" })

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		vim.keymap.set("n", "<CR>", function()
			require("mini.files").go_in({ close_on_file = true })
		end, { buffer = args.data.buf_id, desc = "Open and close explorer" })
	end,
})
