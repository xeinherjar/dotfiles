return {
  {
    'scalameta/nvim-metals',
    dependencies = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local metals_config = require('metals').bare_config()

      metals_config.settings = {
        -- excludedPackages = { 'akka.actor.typed.javadsl', 'com.github.swagger.akka.javadsl' },
        serverProperties = {
          '-XX:+UseG1GC',
          '-XX:+UseStringDeduplication',
        },
        showImplicitArguments = true,
        showInferredType = true,
        testUserInterface = 'Test Explorer',
      }
      metals_config.init_options.statusBarProvider = 'off'
      metals_config.capabilities = capabilities

      -- DAP Settings
      metals_config.on_attach = function(client, bufnr)
        require('metals').setup_dap()
      end


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
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      })
      -- LANGUAGES
      -- clojure
      -- elixir
      lspconfig.elixirls.setup {
        cmd = { vim.fn.expand('~/software/elixir-ls/language_server.sh') },
        capabilities = capabilities,
      }
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
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
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
