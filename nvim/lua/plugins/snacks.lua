return {
  'folke/snacks.nvim',
  enabled = true,
  opts = {
    picker = {
      layout = {
        preset = 'dropdown',
        layout = {
          width = 0.8,
          min_width = 80,
          height = 0.8,
        }
      }
    },
    explorer = {},
  },
  keys = {
    { '<leader>lkm', function() Snacks.picker.keymaps() end,   { desc = '[L]ist [K]ey[m]aps' } },
    { '<leader>ff',  function() Snacks.picker.files() end,     { desc = '[F]ind [F]iles in current working directory' } },
    { '<leader>fg',  function() Snacks.picker.git_files() end, { desc = '[F]ind files in the index and working tree of [G]it' } },
    { '<leader>fb',  function() Snacks.picker.buffers() end,   { desc = '[F]ind open [B]uffers' } },
    { '<leader>fr',  function() Snacks.picker.recent() end,    { desc = '[F]ind [R]ecently opened files' } },
    -- { '<leader>fs', function() builtin.grep_string end, { desc = '[F]ind [S]tring under cursor in current working directory' }},
    { '<leader>frg', function() Snacks.picker.grep() end, { desc = '[F]ind by [R]ip [G]rep' }},
    { '<leader>ss',  function() Snacks.picker.spelling() end,  { desc = '[S]how [S]pelling' } },
    { '<leader>sqf', function() Snacks.picker.qflist() end,    { desc = '[S]how [Q]uick[f]ix' } },
    { '<leader>sjl', function() Snacks.picker.jumps() end,     { desc = '[S]how [J]jump [L]ist' } },
    { '<leader>sll', function() Snacks.picker.loclist() end,   { desc = '[S]how [L]ocation [L]ist' } },
  }
}
