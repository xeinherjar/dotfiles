vim.diagnostic.config({
  signs = {
    numhl = {
      [vim.diagnostic.severity.INFO] = "HintMsg",
      [vim.diagnostic.severity.INFO] = "InfoMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    },
  },
  severity_sort = true,
  update_in_insert = true,
  virtual_text = { prefix = '•' },
  virtual_lines = { current_line = true },
  -- virtual_lines = false,
  -- float = float_config,
})
