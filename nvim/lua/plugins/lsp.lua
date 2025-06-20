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
        useGlobalExecutable = true,
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
    -- TODO: keep stuff in lua/lsp.lua and copy configs to lsp/
    -- or move vim.lsp.enable to here for configs pulled from nvim-lspconfig?
    -- as of 11.2 and https://github.com/neovim/nvim-lspconfig/issues/3494 
    -- blink.cmp capabilities should be auto found
    end
  }
}
