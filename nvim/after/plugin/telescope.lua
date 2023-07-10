local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    layout_config = {
      horizontal = { 
        width = 0.5,
        preview_cutoff = 1
      },
      vertical = { 
        width = 0.5,
        preview_cutoff = 1
      }
    }
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
  },
  --extensions = {},
}

-- https://github.com/nvim-telescope/telescope.nvim#pickers
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles in current working directory' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[F]ind files in the index and working tree of [G]it' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind open [B]uffers' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = '[F]ind [R]ecently opened files' })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = '[F]ind [S]tring under cursor in current working directory' })
vim.keymap.set('n', '<leader>fts', builtin.treesitter, { desc = '[F]ind [T]reesitter [S]ymbols' })
-- TODO: quickfix, marks, loclist, jumplist, registers

