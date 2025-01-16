local telescope = require("telescope")

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
    "cmdline",
}

for _, ext in pairs(exts) do
    telescope.load_extension(ext)
end
