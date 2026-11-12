vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_organize_imports", "ruff_format" }, -- runs both, in order
		javascript = { "prettierd", "prettier", stop_after_first = true }, -- first one found
		typescript = { "prettierd", "prettier", stop_after_first = true },
		go = { "goimports", "gofmt" },
		sh = { "shfmt" },
		c = { "clang_format" },
		cpp = { "clang_format" },
	},
	format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
})

vim.keymap.set({ "n", "x" }, "<leader>cf", function()
	require("conform").format({ lsp_format = "fallback" })
end, { desc = "Format" })
