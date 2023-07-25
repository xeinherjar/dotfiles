local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- clojure
-- haskell
-- javascript
-- python
lspconfig.pyright.setup {
  capabilities = capabilities
}
-- rust

-- scala
local metals_config = require("metals").bare_config()
metals_config.settings = {
  showImplicitArguments = true,
  -- excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

metals_config.capabilities = capabilities
-- Autocmd that will actually be in charge of starting the whole thing
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
-- typescript
