-- Local plugin (lives inside the tatr repo, not its own git repo), so it can't
-- go through vim.pack.add. Put it on the runtimepath by hand instead.
-- Depends on snacks.nvim, which plugin/snacks.lua loads first (alphabetical).
local dir = "/Users/nicorusso/Development/tsoding/tatr/editors/nvim/tatr.nvim"
vim.opt.runtimepath:append(dir)

-- Startup has already scanned plugin/ dirs by now, so source this one's ourselves
for _, file in ipairs(vim.fn.glob(dir .. "/plugin/**/*.{vim,lua}", false, true)) do
	vim.cmd.source(file)
end

local tatr = require("tatr")
tatr.setup({
	-- Point straight at the built binary so this doesn't depend on
	-- $PATH being set up the same way inside Neovim's process as it is
	-- in your terminal (a common source of "failed to spawn tatr").
	-- Rerun `./nob` in the tatr repo to rebuild it in place.
	cmd = "/Users/nicorusso/Development/tsoding/tatr/build/tatr",
})

local map = vim.keymap.set

map("n", "<leader>ts", function()
	tatr.pick()
end, { desc = "Search tasks" })
map("n", "<leader>tl", function()
	tatr.pick({ live = true })
end, { desc = "Query tasks (TQL)" })
map("n", "<leader>tc", function()
	tatr.pick({ closed = true })
end, { desc = "Search closed tasks" })
map("n", "<leader>tn", function()
	tatr.new()
end, { desc = "New task" })
map("n", "<leader>ta", function()
	tatr.summary()
end, { desc = "Task summary" })
map("n", "<leader>tr", function()
	tatr.ref()
end, { desc = "Task references" })
map("n", "<leader>tf", function()
	tatr.find()
end, { desc = "Find task" })
map("n", "<leader>tx", function()
	tatr.yank()
end, { desc = "Copy task HUID" })
