return {
  {
    'scalameta/nvim-metals',
    requires = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local metals_config = require('metals').bare_config()

      metals_config.settings = {
        showImplicitArguments = true,
        showInferredType = true,
        -- excludedPackages = { 'akka.actor.typed.javadsl', 'com.github.swagger.akka.javadsl' },
      }

      metals_config.capabilities = capabilities
      -- Autocmd that will actually be in charge of starting the whole thing
      local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'scala', 'sbt', 'java' },
        callback = function()
          require('metals').initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      })
      -- LANGUAGES
      -- clojure
      -- haskell
      lspconfig.hls.setup {
        capabilities = capabilities,
        filetypes = { 'haskell', 'lhaskell', 'cabal' },
      }
      -- javascript
      -- python
      -- lua
      lspconfig.lua_ls.setup {
        capabilities = capabilities
      }
      lspconfig.pyright.setup {
        capabilities = capabilities
      }
      -- rust 
      lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          vim.lsp.inlay_hint.enable(bufnr)
        end,
        -- https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc
        ['rust-analyzer'] = {
          check = { command = 'clippy' }
        }
      }
      -- typescript
    end
  }
}
