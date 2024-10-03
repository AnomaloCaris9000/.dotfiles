local telescope = require("telescope")

local opts = {
    extensions = {
        menu = {
            ["Go to"] = {
                items = {
                    { "Nvim config", [[cd ~/.config/nvim]], }
                }
            },
        }
    }
}

telescope.setup(opts)

local exts = {
    "file_browser",
    "cmdline",
    "oil",
    "menu",
    "tmux",
}

for _, ext in pairs(exts) do
    telescope.load_extension(ext)
end
