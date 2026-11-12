vim.pack.add({ "https://github.com/blazkowolf/gruber-darker.nvim" })

local transparent_groups = {
	"Normal",
	"NormalNC",
	"NormalFloat",
	"FloatBorder",
	"FloatTitle",
	"SignColumn",
	"FoldColumn",
	"EndOfBuffer",
	"LineNr",
	"CursorLineNr",
	"CursorLine",
	"TabLine",
	"TabLineFill",
	"TabLineSel",
	"WinSeparator",
	-- 'StatusLine', 'StatusLineNC',
}

-- Reapply transparency every time any colorscheme loads.
vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("transparent_bg", { clear = true }),
	callback = function()
		for _, group in ipairs(transparent_groups) do
			vim.api.nvim_set_hl(0, group, { bg = "NONE" })
		end
	end,
})

require("gruber-darker").setup({}) -- only needed if you change options
vim.cmd.colorscheme("gruber-darker")
