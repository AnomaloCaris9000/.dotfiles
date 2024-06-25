local edgy = require("edgy")

edgy.setup {

    exit_when_last = true,
    close_when_all_hidden = false,

    wo = {
        winbar = true,
    },

    animate = {
        enabled = false,
    },

    left = {
        {
            ft = "NvimTree",
            pinned = true,
            open = "NvimTreeToggle",
        },

        {
            ft = "OverseerList",
        },
        {
            ft = "dapui_stacks",
        },
        {
            ft = "dapui_breakpoints",
        },
        {
            ft = "dapui_watches",
        },
        {
            ft = "dapui_scopes",
        },

    },

    bottom = {
        { ft = "toggleterm",
        },
        {
            ft = "Trouble",
        },
        {
            ft = "dap-repl",
        },
        { ft = "dapui_console", },
    }
}
