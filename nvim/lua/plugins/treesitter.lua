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
          'xml', 'html', 'yaml', 'latex', 'zig', 'proto', 'go', 'cpp', 'c_sharp',
          'gdscript',
        }
      )

      -- The treesitter `main` branch does not auto-enable highlighting; start it
      -- per-buffer for any filetype whose parser is installed.
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter_start', { clear = true }),
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if lang and vim.treesitter.language.add(lang) then
            vim.treesitter.start(args.buf, lang)
          end
        end,
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
      vim.keymap.set('n', 'tcc', context.toggle, { desc = '[t]oggle [c]ode [c]ontext' })
    end
  }
}
