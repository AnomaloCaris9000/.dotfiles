local opts = require("options")

local new_au = vim.api.nvim_create_autocmd

new_au(
    { "BufWritePre" },

    {
        pattern = { "*.lua", "*.c", "*.h", "*.hpp", "*.cpp", "*.rs" },
        callback = function() vim.lsp.buf.format() end,
    }
)
