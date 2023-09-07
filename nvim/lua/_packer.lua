-- Only required if you have packer configured as `opt`
--vim.cmd.packadd('packer.nvim')
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	'nvim-telescope/telescope.nvim', tag = '0.1.2',
	requires = { {'nvim-lua/plenary.nvim'} }
  }
  use ({ 'ellisonleao/gruvbox.nvim' })
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,}
  use 'nvim-treesitter/playground'

  -- LSP Setup
  use({'scalameta/nvim-metals', requires = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' }})
  use 'neovim/nvim-lspconfig'
  -- Autocomplete for use with LSPs
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-vsnip' },
      { 'hrsh7th/vim-vsnip' },
    },
  })
end)
