local telescope = require('telescope')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local builtin = require('telescope.builtin')
    local trouble = require('trouble')
    -- Enable completion triggered by <c-x><c-o>
    --vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = '' })
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { buffer = ev.buf, desc = '[G]o to [D]efinition' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = '' })
    vim.keymap.set('n', 'gi', builtin.lsp_implementations, { buffer = ev.buf, desc = '[G]o to [I]mplementation' })
    vim.keymap.set('n', 'gr', builtin.lsp_references, { buffer = ev.buf, desc = '[G]o to [R]eferences' })
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = '' })

    -- Workspaces
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = '[W]orkspace [A]dd' })
    vim.keymap.set('n', '<leader>wd', vim.lsp.buf.remove_workspace_folder,
      { buffer = ev.buf, desc = '[W]orkspace [D]elete' })
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = ev.buf, desc = '[W]orkspace [l]ist' })


    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = '[D]efinition' })
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'Rename' })
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = '[C]ode [A]ction' })
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, { buffer = ev.buf, desc = '[F]ormat file' })

    -- Diagnostics
    vim.keymap.set('n', '<leader>sbd', function(bufnr) builtin.diagnostics(bufnr) end, { desc = '[S]how [B]uffer [D]iagnostics' })
    vim.keymap.set('n', '<leader>sad', builtin.diagnostics, { desc = '[S]how [A]ll [D]iagnostics' })
    vim.keymap.set('n', '<leader>tt', trouble.toggle, { buffer = ev.buf, desc = '[T]rouble [T]oggle' })

  end,
})
vim.keymap.set('n', '<leader>sm', telescope.extensions.metals.commands, { desc = '[S]how [M]etals commands' })


-- Make moving great again
vim.keymap.set('n', '[b', ':bprevious<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = 'Next Buffer' })

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to Window Left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to Window Below' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to Window Up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to Window Right' })

-- move by display line, not text lines
vim.keymap.set('n', 'j', 'gj', { desc = '' })
vim.keymap.set('n', 'k', 'gk', { desc = '' })



vim.keymap.set('n', '<leader>/', ':nohlsearch<CR>', { desc = 'Turn off search results' })
