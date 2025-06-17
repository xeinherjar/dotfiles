local picker = require('snacks').picker
local gitsigns = require('gitsigns')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Buffer local mappings.
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = '' })
    vim.keymap.set('n', 'gd', function() picker.lsp_definitions() end, { buffer = ev.buf, desc = '[G]o to [D]efinition' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'LSP Hover' })
    vim.keymap.set('n', 'gi', function() picker.lsp_implementations() end, { desc = '[G]o to [I]mplementation' })
    vim.keymap.set('n', 'gr', function() picker.lsp_references() end, { desc = '[G]o to [R]eferences' })
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = '[G]o to [T]ype Definition' })

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
    vim.keymap.set('n', '<leader>sld', function() vim.diagnostic.open_float(0, { scope = 'line' }) end,
      { desc = '[S]how [L]ine [D]iagnostics' })
    vim.keymap.set('n', '<leader>sbd', function() picker.diagnostics_buffer() end,
      { desc = '[S]how [B]uffer [D]iagnostics' })
    vim.keymap.set('n', '<leader>sad', function() picker.diagnostics() end, { desc = '[S]how [A]ll [D]iagnostics' })
    vim.keymap.set('n', '<leader>td', function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end,
      { desc = '[T]oggle [D]iagnostics' })
  end,
})

-- Plugins
-- vim.keymap.set('n', '<leader>sm', telescope.extensions.metals.commands, { desc = '[s]how [m]etals commands' })
vim.keymap.set('n', '<leader>gbt', gitsigns.toggle_current_line_blame, { desc = '[g]it [b]lame [t]oggle' })
vim.keymap.set('n', '<leader>gbl', function() gitsigns.blame_line { full = true } end, { desc = '[g]it [b]lame [l]ine' })


-- Make moving great again
vim.keymap.set('n', '[b', ':bprevious<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = 'Next Buffer' })

vim.keymap.set('n', '[j', '<C-o>', { desc = 'Previous Jump Position' })
vim.keymap.set('n', ']j', '<C-i>', { desc = 'Next Jump Postion' })

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to Window Left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to Window Below' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to Window Up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to Window Right' })

-- move by display line, not text lines
vim.keymap.set('n', 'j', 'gj', { desc = '' })
vim.keymap.set('n', 'k', 'gk', { desc = '' })



vim.keymap.set('n', '<leader>/', ':nohlsearch<CR>', { desc = 'Turn off search results' })
