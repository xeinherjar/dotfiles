local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    layout_config = {
      horizontal = { 
        width = 0.8,
        preview_cutoff = 1
      },
      vertical = { 
        width = 0.8,
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
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {

      }

    }
  },
}
require('telescope').load_extension('ui-select')
