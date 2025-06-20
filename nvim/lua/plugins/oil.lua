return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
  },
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  keys = {
    { '<leader>oi', function() vim.cmd('Oil --float') end, { desc = '[Oi]l floating window' } },
  }
}
