local lualine = require("lualine")

lualine.setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "", },
        disabled_filetypes = {
            "NvimTree",
            "Outline",
        }
    },

    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename', },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_z = { 'location' }
    },

    tabline = {
        lualine_a = { "filename", },
        lualine_b = { "buffers", },
        lualine_z = { "tabs", },
    },

    winbar = {
        lualine_c = {},
    },

    extensions = {
        "symbols-outline",
    },
}
