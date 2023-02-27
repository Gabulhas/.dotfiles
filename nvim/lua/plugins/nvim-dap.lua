local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.fn.sign_define('DapBreakpoint', {text = 'B', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped', {text = '▶️', texthl = '', linehl = '', numhl = ''})

vim.keymap.set('n', '<F5>', require'dap'.continue)
vim.keymap.set('n', '<F10>', require'dap'.step_over)
vim.keymap.set('n', '<F11>', require'dap'.step_into)
vim.keymap.set('n', '<F12>', require'dap'.step_out)
vim.keymap.set('n', '<leader>b', require'dap'.toggle_breakpoint)

require("dap").adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode", -- adjust as needed
    name = "lldb"
}

local lldb = {
    name = "Launch lldb",
    type = "lldb", -- matches the adapter
    request = "launch", -- could also attach to a currently running process
    program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false
}

require('dap').configurations.rust = {
    lldb -- different debuggers or more configurations can be used here
}

require('dap').configurations.c = {
    lldb -- different debuggers or more configurations can be used here
}
