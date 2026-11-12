vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "nvim-treesitter" and ev.data.kind ~= "delete" then
			vim.schedule(function()
				vim.cmd("TSUpdate")
			end)
		end
	end,
})

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

require("nvim-treesitter").install({
	"lua",
	"vim",
	"vimdoc",
	"markdown",
	"markdown_inline",
	"html",
	"bash",
	"json",
	"c",
	"cpp",
	"css",
	"go",
	"javascript",
	"python",
	"regex",
	"rust",
	"toml",
	"typescript",
	"tsx",
	"make",
	"sql",
	"yaml",
	-- add your languages here
})

-- Turn on treesitter highlighting for any filetype that has a parser.
-- pcall makes it a silent no-op for filetypes without one.
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
