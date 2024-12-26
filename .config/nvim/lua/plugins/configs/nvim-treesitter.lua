local M = {

    ensure_installed = { "ocaml", "c", "cpp", "lua", "java", "rust", },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
        disable = {"latex"},
        additional_vim_regex_highlighting = false,
    },

    refactor = {
        navigation = {
            enable = true,
            -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
            },
        },
    },
}

return M
