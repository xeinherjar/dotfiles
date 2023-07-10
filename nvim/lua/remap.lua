vim.g.mapleader = " "

vim.keymap.set('i', 'jj', '<Esc>', { desc = '[G]o to [Definition]' })

-- LSP MAPPINGS --
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to [Definition]' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format { async = true }
end)
