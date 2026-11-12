vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

local fzf = require("fzf-lua")
fzf.setup({})
fzf.register_ui_select() -- code actions etc. use fzf instead of a plain list

local map = vim.keymap.set
map("n", "<leader><space>", fzf.files, { desc = "Find files" })
map("n", "<leader>ff", fzf.files, { desc = "Find files" })
map("n", "<leader>/", fzf.live_grep, { desc = "Grep" })
map("n", "<leader>fg", fzf.live_grep, { desc = "Grep" })
map("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })
map("n", "<leader>fr", fzf.oldfiles, { desc = "Recent files" })
map("n", "<leader>sh", fzf.helptags, { desc = "Help" })
map("n", "<leader>sk", fzf.keymaps, { desc = "Keymaps" })
map("n", "<leader>sd", fzf.diagnostics_document, { desc = "Diagnostics" })
map("n", "<leader>sw", fzf.grep_cword, { desc = "Grep word under cursor" })
map("n", "<leader>sR", fzf.resume, { desc = "Resume last picker" })
