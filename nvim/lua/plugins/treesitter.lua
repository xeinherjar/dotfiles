return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    config = function()
      local ts = require('nvim-treesitter')
      ts.install(
        { 'vimdoc', 'javascript', 'typescript', 'scala', 'lua', 'rust', 'python',
          'haskell', 'bash', 'elixir', 'heex', 'eex', 'markdown', 'markdown_inline',
          'xml', 'html', 'yaml', 'latex', 'zig', 'proto', 'go'
        }
      )
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
      vim.keymap.set('n', 'tcc', context.toggle, { desc = '[t]oggle [c]ode [c]ontext' })
    end
  }
}
