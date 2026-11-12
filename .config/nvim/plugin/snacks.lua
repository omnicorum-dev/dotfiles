vim.pack.add({ "https://github.com/folke/snacks.nvim" })

local snacks = require("snacks")
snacks.setup({
	bigfile = { enabled = true }, -- disables heavy features on huge files
	indent = { enabled = true }, -- indent guides + highlighted current scope
	words = { enabled = true }, -- highlights LSP references of the word under cursor
})

local map = vim.keymap.set

-- Jump between the highlighted references (same as LazyVim)
map("n", "]]", function()
	snacks.words.jump(vim.v.count1)
end, { desc = "Next reference" })
map("n", "[[", function()
	snacks.words.jump(-vim.v.count1)
end, { desc = "Prev reference" })

-- Delete buffer but keep the window/split layout
map("n", "<leader>bd", function()
	snacks.bufdelete()
end, { desc = "Delete buffer" })
