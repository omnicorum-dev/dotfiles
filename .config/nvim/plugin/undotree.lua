vim.cmd.packadd("nvim.undotree") -- built-in, just not loaded by default

vim.keymap.set("n", "<leader>u", function()
	require("undotree").open({ command = "botright 50vnew" })
end, { desc = "Undo tree" })
