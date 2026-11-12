local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.shiftround = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- Behaviour
opt.mouse = "a"
opt.undofile = true
opt.confirm = true
opt.updatetime = 200
opt.timeoutlen = 300

-- Layout
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 5
opt.sidescrolloff = 10
opt.wrap = false
opt.laststatus = 3
opt.winborder = "rounded"

-- Show invisible characters
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- System clipboard
vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)
