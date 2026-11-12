-- Leader must be set before any mapping that uses <leader> is defined.
-- init.lua runs before plugin/ files, so setting it here covers everything.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.options")
require("config.keymaps")
require("config.autocmds")
