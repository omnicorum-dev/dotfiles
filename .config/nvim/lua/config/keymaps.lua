local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

map("n", "<leader>-", "<C-w>s", { desc = "Split below" })
map("n", "<leader>|", "<C-w>v", { desc = "Split right" })

map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bc", "<cmd>enew<CR>", { desc = "Create buffer" })

map({ "n", "i", "x" }, "<C-s>", "<cmd>write<CR><Esc>", { desc = "Save" })
map("n", "<leader>qq", "<cmd>qall<CR>", { desc = "Quit all" })

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

map("x", "<", "<gv")
map("x", ">", ">gv")

map("n", "<A-j>", "<cmd>move .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>move .-2<CR>==", { desc = "Move line up" })
map("x", "<A-j>", ":move '>+1<CR>gv=gv", { desc = "Move selection down" })
map("x", "<A-k>", ":move '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Terminal
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
map("t", "<C-x>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
map("t", "<C-e>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
