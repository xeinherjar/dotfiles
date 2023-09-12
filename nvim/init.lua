require("_packer")
require("lsp")
require("remap")
require("set")


vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
