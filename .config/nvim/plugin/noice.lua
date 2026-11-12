-- lazy.nvim's `dependencies`: just list them in the same add call
vim.pack.add({
	"https://github.com/MunifTanjim/nui.nvim", -- UI library noice draws with
	"https://github.com/folke/noice.nvim",
})

require("noice").setup({
	-- Same presets LazyVim uses
	presets = {
		bottom_search = true, -- / and ? stay at the bottom; : floats
		command_palette = true, -- cmdline and its completion menu together
		long_message_to_split = true, -- long output goes to a split, not a popup
	},
	-- Also from LazyVim: show "written", undo/redo messages in the small
	-- corner view instead of full notifications
	routes = {
		{
			filter = {
				event = "msg_show",
				any = {
					{ find = "%d+L, %d+B" },
					{ find = "; after #%d+" },
					{ find = "; before #%d+" },
				},
			},
			view = "mini",
		},
	},
})

local map = vim.keymap.set
local noice = require("noice")
map("n", "<leader>nl", function()
	noice.cmd("last")
end, { desc = "Last message" })
map("n", "<leader>nh", function()
	noice.cmd("history")
end, { desc = "Message history" })
map("n", "<leader>na", function()
	noice.cmd("all")
end, { desc = "All messages" })
map("n", "<leader>nd", function()
	noice.cmd("dismiss")
end, { desc = "Dismiss messages" })

-- Shift+Enter in the cmdline: run the command and send its output to a popup
map("c", "<S-Enter>", function()
	noice.redirect(vim.fn.getcmdline())
end, { desc = "Redirect cmdline output" })
