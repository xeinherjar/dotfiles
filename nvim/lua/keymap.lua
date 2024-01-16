-- Only for VIM provided FNs, other key maps go into their respective plugins
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    --vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = '' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = '[G]o to [D]efinition' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = '' })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf, desc = '[G]o to [I]mplementation' })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = '' })
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = '[W]orkspace [A]dd' })
    vim.keymap.set('n', '<leader>wd', vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc = '[W]orkspace [D]elete' })
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = ev.buf, desc = '[W]orkspace [l]ist' })
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = '[D]efinition' })
    vim.keymap.set('n', '<leader><F2>', vim.lsp.buf.rename, { buffer = ev.buf, desc = '' })
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = '[C]ode [A]ction' })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = '[R]eferences' })
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, { buffer = ev.buf, desc = '[F]ormat file' })
  end,
})
