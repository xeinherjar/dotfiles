vim.lsp.config('elixirls', {
  cmd = { vim.fn.expand('~/software/elixir-ls/language_server.sh') }
})

vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      check = { command = 'clippy' }
    }
  }
})

-- Currently causes zls to panic
-- vim.lsp.config('zls', {
--   settings = {
--     semantic_tokens = "partial",
--     enable_build_on_save = true
--   }
-- })

vim.lsp.enable({
  'lua-ls',
  'zls',
  -- From nvim-lspconfig, TODO: lua/plugins/lsp.lua
  'hsl',
  'elixirls',
  'rust_analyzer',
  'pyright',
  'ts_ls',
})

-- Most ideas taken from https://lsp-zero.netlify.app/blog/lsp-client-features.html
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- Enable Inlay Hints
    if client and client:supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end


    -- Highlight all references in doc when cursor is idle
    if client and client:supports_method('textDocument/documentHighlight') then
      local autocmd = vim.api.nvim_create_autocmd
      local augroup = vim.api.nvim_create_augroup('lsp_highlight', { clear = false })

      vim.api.nvim_clear_autocmds({ buffer = args.buf, group = augroup })

      autocmd({ 'CursorHold' }, {
        group = augroup,
        buffer = args.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      autocmd({ 'CursorMoved' }, {
        group = augroup,
        buffer = args.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})
