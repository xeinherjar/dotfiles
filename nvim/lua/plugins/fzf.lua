-- Fuzzy finder / picker. Needs the `fzf` and `rg` binaries on PATH.
-- Replaced snacks.picker; LSP-nav + diagnostic pickers live in lua/keymap.lua.
return {
  'ibhagwan/fzf-lua',
  lazy = false,
  config = function()
    local fzf = require('fzf-lua')

    fzf.setup({
      winopts = {
        height = 0.85,
        width = 0.85,
        -- telescope-style two-pane layout: match list left, live preview right
        preview = {
          layout = 'horizontal',
          horizontal = 'right:55%',
        },
      },
    })

    -- Route vim.ui.select (e.g. code actions) through fzf-lua
    fzf.register_ui_select()

    local map = function(lhs, fn, desc) vim.keymap.set('n', lhs, fn, { desc = desc }) end

    map('<leader>lkm', fzf.keymaps, '[L]ist [K]ey[m]aps')
    map('<leader>ff', fzf.files, '[F]ind [F]iles in current working directory')
    map('<leader>fg', fzf.git_files, '[F]ind files in the index and working tree of [G]it')
    map('<leader>fb', fzf.buffers, '[F]ind open [B]uffers')
    map('<leader>fr', fzf.oldfiles, '[F]ind [R]ecently opened files')
    map('<leader>fs', fzf.grep_cword, '[F]ind [S]tring under cursor in current working directory')
    map('<leader>frg', fzf.live_grep, '[F]ind by [R]ip [G]rep')
    map('<leader>sqf', fzf.quickfix, '[S]how [Q]uick[f]ix')
    map('<leader>sjl', fzf.jumps, '[S]how [J]ump [L]ist')
    map('<leader>sll', fzf.loclist, '[S]how [L]ocation [L]ist')

    -- fzf-lua has no builtin spelling picker; build one from vim.fn.spellsuggest
    map('<leader>ss', function()
      local word = vim.fn.expand('<cword>')
      if word == '' then return end
      local suggestions = vim.fn.spellsuggest(word)
      if vim.tbl_isempty(suggestions) then
        vim.notify('No spelling suggestions for "' .. word .. '"', vim.log.levels.INFO)
        return
      end
      fzf.fzf_exec(suggestions, {
        prompt = 'Spelling> ',
        actions = {
          ['default'] = function(selected)
            if selected and selected[1] then
              vim.cmd('normal! "_ciw' .. selected[1])
              vim.cmd('stopinsert')
            end
          end,
        },
      })
    end, '[S]how [S]pelling')
  end,
}
