return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text'
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      dap.configurations.scala = {
        {
          type = "scala",
          request = "attach",
          name = "gqd debugger",
          hostName = "localhost",
          port = "9999",
          buildTarget = "root"
        },
        {
          type = 'scala',
          request = 'launch',
          name = 'Run or Test Target',
          metals = {
            runType = 'runOrTestFile',
          },
        },
        {
          type = 'scala',
          request = 'launch',
          name = 'Test Target',
          metals = {
            runType = 'testTarget',
          },
        },
        {
          name = 'Remote Debug',
          type = 'scala',
          request = 'attach',
          port = 9999,
          host = '127.0.0.1',
          hostName = '127.0.0.1',
          class = 'bootstrap.liftweb.Boot',
          buildTarget = 'main',
          sourceMaps = true,
          metals = {
            runType = 'run',
          },
        },
      }


      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[d]ap [b]reakpoint' })
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[d]ap [c]ontinue' })
      vim.keymap.set('n', '<leader>d?', function()
        dapui.eval(nil, { enter = true })
      end)
      vim.keymap.set('n', '<leader>dq', dap.disconnect, { desc = '[d]ap [q]uit' })
    end
  }
}
