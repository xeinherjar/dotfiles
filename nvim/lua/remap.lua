local builtin = require('telescope.builtin')
vim.g.mapleader = " "

vim.keymap.set('i', 'jj', '<Esc>', { desc = '<Esc> for when <Esc> is just too much' })

-- LSP MAPPINGS --
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to [Definition]' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = '[G]o to [I]mplementation' })
vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format { async = true }
end, { desc = '[F]ormat file' })
vim.keymap.set('n', '<leader>sbd', function(bufnr) builtin.diagnostics(bufnr) end, { desc = '[S]how [B]uffer [D]iagnostics' })
vim.keymap.set('n', '<leader>sad', builtin.diagnostics, { desc = '[S]how [A]ll [D]iagnostics' })
vim.keymap.set('n', '<leader>sf', vim.lsp.buf.code_action, { desc = '[S]how [F]ix' })
