return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters = {
      csharpier = {
        command = 'dotnet',
        args = { 'tool', 'run', 'csharpier' },
        stdin = true,
      },
    },
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      cs = { "csharpier" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback", -- Use LSP if formatter is missing
    },
  },
}
