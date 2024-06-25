local dap = require("dap")
local dap_vscode = require("dap.ext.vscode")

dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" },
}

dap.configurations.c = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = function()
            return vim.fn.input("Arguments: ")
        end,
        cwd = "${workspaceFolder}",
    },
}


dap_vscode.load_launchjs(nil, { cppdbg = { "c" } })
