vim.pack.add({
	-- Pinning to a release lets blink download its prebuilt fuzzy matcher
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
})

require("blink.cmp").setup({
	keymap = { preset = "default" }, -- <C-y> accept, <C-n>/<C-p> navigate
	completion = { documentation = { auto_show = true } },
})
