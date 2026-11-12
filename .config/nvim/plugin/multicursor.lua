vim.pack.add({
	-- lazy.nvim's `branch = "1.0"`; version accepts a branch, tag, or commit
	{ src = "https://github.com/jake-stewart/multicursor.nvim", version = "1.0" },
})

local mc = require("multicursor-nvim")
mc.setup()

local map = vim.keymap.set
map({ "n", "x" }, "<leader>mk", function()
	mc.lineAddCursor(-1)
end, { desc = "Multicursor: Add above" })
map({ "n", "x" }, "<leader>mj", function()
	mc.lineAddCursor(1)
end, { desc = "Multicursor: Add below" })
map({ "n", "x" }, "<leader>mn", function()
	mc.matchAddCursor(1)
end, { desc = "Multicursor: Next match" })
map({ "n", "x" }, "<leader>mN", function()
	mc.matchAddCursor(-1)
end, { desc = "Multicursor: Prev match" })
map({ "n", "x" }, "<leader>ms", function()
	mc.matchSkipCursor(1)
end, { desc = "Multicursor: Skip match" })
map({ "n", "x" }, "<leader>mS", function()
	mc.matchSkipCursor(-1)
end, { desc = "Multicursor: Skip prev match" })
map("n", "<leader>mc", mc.clearCursors, { desc = "Multicursor: Clear" })

mc.addKeymapLayer(function(layerSet)
	layerSet("n", "<Esc>", function()
		if not mc.cursorsEnabled() then
			mc.enableCursors()
		else
			mc.clearCursors()
		end
	end)
end)
