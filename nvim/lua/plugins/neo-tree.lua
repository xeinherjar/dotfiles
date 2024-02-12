return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    --'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup()
    vim.keymap.set('n', '<leader>nt', '<cmd>Neotree toggle<cr>', { desc = 'Toggle [n]eo [t]ree' })
  end

}
