local opts = {

    cursorcolumn = true,

    cursorline = true,

    number = true,
    relativenumber = true,

    -- identation
    tabstop = 4,
    autoindent = true,
    expandtab = true,
    shiftwidth = 4,
    smartindent = true,
    cindent = true,

    termguicolors = true,
    syntax = "on",

    splitkeep = "screen",

    laststatus = 3,
    --showcmd = true,
    scrolloff = 10,

    conceallevel = 0,
    --timeoutlen = 10000,
}

for k, v in pairs(opts) do
    vim.opt[k] = v
end
