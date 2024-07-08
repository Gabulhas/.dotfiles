local dap, dapui = require "dap", require "dapui"

require("nvim-dap-virtual-text").setup()
dapui.setup()

vim.fn.sign_define('DapBreakpoint',
                   {text = 'B', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped',
                   {text = '▶️', texthl = '', linehl = '', numhl = ''})

local keymap = {
    d = {
        name = "Debug",
        R = {"<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor"},
        E = {
            "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>",
            "Evaluate Input"
        },
        C = {
            "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
            "Conditional Breakpoint"
        },
        U = {"<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI"},
        b = {"<cmd>lua require'dap'.step_back()<cr>", "Step Back"},
        c = {"<cmd>lua require'dap'.continue()<cr>", "Continue"},
        d = {"<cmd>lua require'dap'.disconnect()<cr>", "Disconnect"},
        e = {"<cmd>lua require'dapui'.eval()<cr>", "Evaluate"},
        g = {"<cmd>lua require'dap'.session()<cr>", "Get Session"},
        h = {"<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables"},
        S = {"<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes"},
        i = {"<cmd>lua require'dap'.step_into()<cr>", "Step Into"},
        o = {"<cmd>lua require'dap'.step_over()<cr>", "Step Over"},
        p = {"<cmd>lua require'dap'.pause.toggle()<cr>", "Pause"},
        q = {"<cmd>lua require'dap'.close()<cr>", "Quit"},
        r = {"<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl"},
        s = {"<cmd>lua require'dap'.continue()<cr>", "Start"},
        t = {
            "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint"
        },
        x = {"<cmd>lua require'dap'.terminate()<cr>", "Terminate"},
        u = {"<cmd>lua require'dap'.step_out()<cr>", "Step Out"},
        G = {"<cmd>lua require('dap-go').debug_test()<cr>", "Go Debug Test"}
    }
}

vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F3>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F2>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")

local function get_arguments()
    local co = coroutine.running()
    if co then
        return coroutine.create(function()
            local args = {}
            vim.ui.input({prompt = 'Enter command-line arguments: '},
                         function(input) args = vim.split(input, " ") end)
            coroutine.resume(co, args)
        end)
    else
        local args = {}
        vim.ui.input({prompt = 'Enter command-line arguments: '},
                     function(input) args = vim.split(input, " ") end)
        return args
    end
end

require('dap-go').setup({
    dap_configurations = {
        {
            type = "go",
            name = "Debug with arguments",
            request = "launch",
            program = "${file}",
            args = get_arguments
        }
    }
})

-- C/CPP/RUST
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
    name = 'lldb'
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/',
                                'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {}

        -- 💀
        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        -- runInTerminal = false,
    }
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.listeners.after.event_initialized["dapui_config"] =
    function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] =
    function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
