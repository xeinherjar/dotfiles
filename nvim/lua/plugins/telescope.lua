return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require('telescope.actions')
      local builtin = require('telescope.builtin')

      require('telescope').setup({
        defaults = {
          layout_strategy = 'vertical',
          layout_config = { prompt_position = 'bottom' },
          file_ignore_patterns = {
              "^./worktrees/",
              "^./project/",
              "^./target/",
              "^./.metals/",
              "^./.bloop/"
          },
        },
        pickers = {
          buffers = {
          show_all_buffers = true,
          attach_mappings = function(_, local_map)
            local_map('n', 'd', actions.delete_buffer)
            local_map('i', '<c-x>', actions.delete_buffer)
            return true
          end,
          }
        }
      })

      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles in current working directory' })
      -- https://github.com/nvim-telescope/telescope.nvim#pickers
      vim.keymap.set('n', '<leader>lkm', builtin.keymaps, { desc = '[L]ist [K]ey[m]aps' })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles in current working directory' })
      -- vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[F]ind files in the index and working tree of [G]it' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind open [B]uffers' })
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = '[F]ind [R]ecently opened files' })
      vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = '[F]ind [S]tring under cursor in current working directory' })
      vim.keymap.set('n', '<leader>frg', builtin.live_grep, { desc = '[F]ind by [R]ip [G]rep' })
      vim.keymap.set('n', '<leader>fts', builtin.treesitter, { desc = '[F]ind [T]reesitter [S]ymbols' })
      vim.keymap.set('n', '<leader>ss', builtin.spell_suggest, { desc = '[S]how [S]pelling' })

      vim.keymap.set('n', '<leader>sqf', builtin.quickfix, { desc = '[S]how [Q]uick[f]ix' })
      vim.keymap.set('n', '<leader>sjl', builtin.jumplist, { desc = '[S]how [J]jump [L]ist' })
      vim.keymap.set('n', '<leader>sll', builtin.loclist, { desc = '[S]how [L]ocation [L]ist' })
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup({
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown { }
          }
        },
      })
    require('telescope').load_extension('ui-select')
    end
  }
}
