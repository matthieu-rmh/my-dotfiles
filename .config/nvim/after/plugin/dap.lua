-- /usr/bin/python3
    local dap, dapui = require('dap'), require('dapui')

    -- python adapter conf
      dap.adapters.python = {
        type = 'executable';
        command = '/usr/bin/python3';
        args = { '-m', 'debugpy.adapter' };
      }
    -- python conf
    dap.configurations.python = {
      {
        type = 'python';
        request = 'launch';
        name = "Py Launch file";
        -- program = "/home/aranorn/dev/work/python/zeendoc-sage-connector/lib/main.py";
        program = "/opt/odoo17/odoo/odoo-bin";
        args = {'-c', '/etc/odoo17.conf', '-u', 'capvi_catalog'},
        repl_lang = "python",
        pythonPath = function()
          return '/usr/bin/python3'
        end;
      },
    }


    vim.keymap.set('n', '<F5>', function() dap.continue() end)
    vim.keymap.set('n', '<F10>', function() dap.step_over() end)
    vim.keymap.set('n', '<F11>', function() dap.step_into() end)
    vim.keymap.set('n', '<F12>', function() dap.step_out() end)
    vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
    vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
    vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
    vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end)
    vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
      require('dap.ui.widgets').preview()
    end)
    vim.keymap.set('n', '<Leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end)
    -- vim.keymap.set('n', '<Leader>ds', function()
    --   local widgets = require('dap.ui.widgets')
    --   widgets.centered_float(widgets.scopes)
    -- end)
    
    -- vim.keymap.set('n', '<Leader>dui', function() dapui.toggle("tray") end)
    vim.keymap.set('n', '<Leader>ds', function() dapui.float_element("scopes", {enter=true}) end)
    vim.keymap.set('n', '<Leader>cc', function() dapui.float_element("console") end)
    vim.keymap.set('n', '<Leader>pl', function() dapui.float_element("repl") end)
