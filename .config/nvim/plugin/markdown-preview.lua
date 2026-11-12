-- lazy.nvim's `build`: run the plugin's installer after install/update.
-- Defined before vim.pack.add so it also catches the first install.
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "markdown-preview.nvim" and ev.data.kind ~= "delete" then
			vim.cmd.packadd("markdown-preview.nvim") -- make sure it's loaded before calling it
			vim.fn["mkdp#util#install"]()
		end
	end,
})

vim.pack.add({ "https://github.com/iamcco/markdown-preview.nvim" })
