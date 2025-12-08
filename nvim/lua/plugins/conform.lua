return {
  'stevearc/conform.nvim',
  enabled = false,
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      rust = { 'rustfmt', lsp_format = 'fallback' },
      scala = { 'scalafmt', lsp_format = 'fallback' },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = 'fallback',
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
  }
}
