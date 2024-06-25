local keymap = vim.keymap
local wk = require("which-key")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap.set("", "az", "aw")

keymap.set("i", "jk", "<esc>")

keymap.set("n", "tt", "<cmd>NvimTreeToggle<cr>")



wk.register({
    f = {
        name = "Find",
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        g = { "<cmd>Telescope live_grep<cr>", "Find Grep" },
        p = { "<cmd>Telescope project<cr>", "Find Projects" },
        b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
    },
    d = {
        name = "Dap",
        c = { "<cmd>DapContinue<cr>", "Continue" },
        b = { "<cmd>DapToggleBreakpoint<cr>", "Toggole Breakpoint" },
        r = { "<cmd>DapToggleRepl<cr>", "Toggle Repl" },
        n = { "<cmd>DapStepOver<cr>", "Step Over", }
    },
    [":"] = {
        { "<cmd>Telescope cmdline<cr>", "Commands" }
    },
    ["<leader>"] = {
        { "<cmd>Telescope picker_list<cr>", "All Telescope Pickers" }
    }
}, { prefix = "<leader>" })
