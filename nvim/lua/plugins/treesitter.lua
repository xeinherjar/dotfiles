return { 
  'nvim-treesitter/nvim-treesitter', 
  build = ':TSUpdate',
  config = function()
    local config = require('nvim-treesitter.configs')
    config.setup({ 
      ensure_installed = { 'vimdoc', 'javascript', 'typescript', 'scala', 'lua', 'rust', 'python', 'haskell', 'bash', 'elixir', 'heex', 'eex' },
        sync_install = false,  -- Install parsers synchronously
        auto_install = false,  -- auto install missing parsers when entering buffer
        highlight = { enable = true },
        indent = { enable = true }
    })
  end
}
