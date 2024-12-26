local telescope = require("telescope")
local commander = require("commander")

local exec = function(s)
    return "<cmd>" .. s .. "<cr>"
end

local opts = {
    extensions = {

        switch = {
            matchers = {
                name = "switch header",
                from = "%.c",
                to = "%.h"
            }
        },
    }
}

telescope.setup(opts)

local exts = {
    "dap",
    "switch",
    "project",
    "file_browser",
    "frecency",
    "picker_list",
    "cmdline",
    "oil"
}

for _, ext in pairs(exts) do
    telescope.load_extension(ext)
end

commander.add({
    {
        desc = "Close Buffer",
        cmd = "<cmd>bw<cr>",
    },
    {
        desc = "Telescope (All Pickers)",
        cmd = "<cmd>Telescope picker_list<cr>",
    },
    {
        desc = "Run Task",
        cmd = exec("OverseerRun"),
    }
})
