-- plugin/which-key.lua
vim.pack.add({ "https://github.com/folke/which-key.nvim" })
require("which-key").setup({
	spec = {
		{ "<leader>b", group = "buffer" },
		{ "<leader>c", group = "code" },
		{ "<leader>f", group = "find" },
		{ "<leader>g", group = "git" },
		{ "<leader>gh", group = "hunks" },
		{ "<leader>m", group = "multicursor" },
		{ "<leader>q", group = "quit" },
		{ "<leader>s", group = "search" },
		{ "<leader>n", group = "noice" },
		{ "<leader>h", group = "harpoon" },
		{ "<leader>t", group = "tatr" },
	},
})
