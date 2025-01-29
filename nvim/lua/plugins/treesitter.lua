return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local config = require('nvim-treesitter.configs')
      config.setup({ 
        ensure_installed = { 'vimdoc', 'javascript', 'typescript', 'scala', 'lua', 'rust', 'python', 'haskell', 'bash', 'elixir', 'heex', 'eex', 'markdown', 'markdown_inline', 'xml', 'html', 'yaml', 'latex' },
          sync_install = false,  -- Install parsers synchronously
          auto_install = false,  -- auto install missing parsers when entering buffer
          highlight = { enable = true },
          indent = { enable = true }
      })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      local context = require('treesitter-context')
      context.setup {
        enable = false,
        patterns = {
          default = {
            'class',
            'function',
            'method',
          }
        }
      }
      vim.keymap.set('n', '[c', function() context.go_to_context(vim.v.count1) end, { silent = true })
      vim.keymap.set('n', 'tcc', context.toggle , { desc = '[t]oggle [c]ode [c]ontext' })
    end
  }
}
