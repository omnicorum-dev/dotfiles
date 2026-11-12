vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim", -- required by harpoon
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

local harpoon = require("harpoon")
harpoon:setup()

local map = vim.keymap.set

map("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "Harpoon add file" })
map("n", "<leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon menu" })

-- <leader>h1 through <leader>h5 jump to marked files
for i = 1, 5 do
	map("n", "<leader>h" .. i, function()
		harpoon:list():select(i)
	end, { desc = "Harpoon to file " .. i })
end
