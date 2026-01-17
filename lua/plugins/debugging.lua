return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- REQUIRED
dapui.setup({
    controls = {
        dapui_watches = {
    enabled = true, -- Enables the watches feature 
--size = { width = 40, height = 10 },
-- Customize the size of the watch panel 
    level = 'info', -- Set the level of notifications to display (can be 'info', 'warn', 'error')
},
}, 
})

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

    -- CodeLLDB adapter
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.cpp = {
      {
        name = "Launch C++",
        type = "codelldb",
        request = "launch",
        program = function()
          local file = vim.fn.expand("%:r")
          os.execute("clang++ -std=c++20 -g " .. vim.fn.expand("%") .. " -o " .. file)
          return vim.fn.getcwd() .. "/" .. file
        end,
        cwd = vim.fn.getcwd(),
        stopOnEntry = false,
        args = {},
      },
    }

    dap.configurations.c = dap.configurations.cpp

    -- Keymaps
    vim.keymap.set("n", "<Leader>dt", function() dapui.toggle() end)
    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint)
    vim.keymap.set("n", "<Leader>dc", dap.continue)
    vim.keymap.set("n", "<Leader>do", dap.step_over)
    vim.keymap.set("n", "<Leader>di", dap.step_into)
    vim.keymap.set("n", "<Leader>dO", dap.step_out)
    vim.keymap.set("n", "<Leader>dr", dap.repl.open)
    vim.keymap.set("n", "<Leader>dq", dap.terminate)
  end,
}

