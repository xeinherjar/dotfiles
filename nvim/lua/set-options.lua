vim.opt.guicursor = ''

vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2 -- tab = 2 spaces
vim.opt.shiftwidth = 2 -- auto indent 2 spaces
vim.opt.expandtab = true -- insert tab as spaces

vim.opt.smartindent = true
vim.opt.wrap = false -- don't wrap lines

vim.opt.hlsearch = true -- highlight search results
vim.opt.incsearch = true -- show partial results while typing
vim.opt.smartcase = true -- search is not case sensitive until you use a cap
vim.opt.ignorecase = true -- search is not case sensitive until you use a cap

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.o.background = 'dark' -- or 'light' for light mode

vim.opt.scrolloff = 5  -- minimum number of lines to show above/below cursor
vim.opt.sidescrolloff = 10  -- minimum number of lines to show left/right of cursor
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 50

vim.opt.colorcolumn = '80'
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = '' -- disable mouse

-- Good old spell check
-- defaults are '[s' and ']s' next/previous, 'z=' for spell list
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

vim.keymap.set('i', 'jj', '<Esc>', { desc = '<Esc> for when <Esc> is just too much' })


vim.opt.listchars = { tab = '→·', nbsp = '␣', trail = '·' }
vim.opt.showbreak = '↳'
vim.opt.list = true


vim.cmd([[colorscheme gruvbox]])
