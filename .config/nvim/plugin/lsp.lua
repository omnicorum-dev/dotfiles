vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.enable({
	"lua_ls",
	"basedpyright",
	"ruff",
	"ts_ls",
	"gopls",
	"rust_analyzer",
	"clangd",
})

vim.diagnostic.config({
	virtual_text = true, -- inline messages (off by default now)
	severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf, desc = "Go to definition" })
	end,
})
