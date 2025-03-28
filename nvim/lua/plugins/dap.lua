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
      }

      -- Try to load work-specific configurations if they exist, currently only DAP
      local home = os.getenv("HOME")
      local work_config_path = home .. "/projects/work.dap.lua"
      local work_loader, err = loadfile(work_config_path)
      if work_loader then
        local work_configs = work_loader()
        if work_configs and work_configs.scala then
          for _, config in ipairs(work_configs.scala) do
            table.insert(dap.configurations.scala, config)
          end
        end
      end

      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[d]ap [b]reakpoint' })
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[d]ap [c]ontinue' })
      vim.keymap.set('n', '<leader>d?', function()
        dapui.eval(nil, { enter = true })
      end)
      vim.keymap.set('n', '<leader>dq', function()
          dap.disconnect()
          dapui.close()
        end,
        { desc = '[d]ap [q]uit' })
    end
  }
}
