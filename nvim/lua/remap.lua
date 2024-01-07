local builtin = require('telescope.builtin')
vim.g.mapleader = " "

vim.keymap.set('i', 'jj', '<Esc>', { desc = '<Esc> for when <Esc> is just too much' })


-- https://github.com/nvim-telescope/telescope.nvim#pickers
vim.keymap.set('n', '<leader>lkm', builtin.keymaps, { desc = '[L]ist [K]ey[m]aps' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles in current working directory' })
-- vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[F]ind files in the index and working tree of [G]it' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind open [B]uffers' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = '[F]ind [R]ecently opened files' })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = '[F]ind [S]tring under cursor in current working directory' })
vim.keymap.set('n', '<leader>frg', builtin.live_grep, { desc = '[F]ind by [R]ip [G]rep' })
vim.keymap.set('n', '<leader>fts', builtin.treesitter, { desc = '[F]ind [T]reesitter [S]ymbols' })
vim.keymap.set('n', '<leader>ss', builtin.spell_suggest, { desc = '[S]how [S]pelling' })

vim.keymap.set('n', '<leader>sqf', builtin.quickfix, { desc = '[S]how [Q]uick[fix]' })
vim.keymap.set('n', '<leader>sjl', builtin.jumplist, { desc = '[S]how [J]jump [L]ist' })
vim.keymap.set('n', '<leader>sll', builtin.loclist, { desc = '[S]how [L]ocation [L]ist' })
-- [TODO]: marks, registers


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

