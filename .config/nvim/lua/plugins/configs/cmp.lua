local cmp = require("cmp")
local luasnip = require("luasnip")
local utils = require("utils")

local border = {
    rounded = { "╭", "─", "o", "│", "╯", "─", "╰", "│" },
}

cmp.setup {

    performance = {
        max_view_entries = 8,
    },

    window = {
        documentation = {
            border = border.rounded,
        },
        completion = {
            border = border.rounded,
        }
    },

    sources = cmp.config.sources({
        { name = "luasnip", },
        { name = "nvim_lsp", },
        { name = "vimtex", },
        { name = "nvim_lua", },
        { name = "doxygen", },
        { name = "buffer", },
    }),

    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ["<esc>"] = function(fallback)
            if cmp.visible() then
                cmp.close()
            else
                fallback()
            end
        end,
        ["<cr>"] = function(fallback)
            if cmp.get_selected_entry() then
                cmp.confirm({ select = true })
            else
                fallback()
            end
        end,
        ["<tab>"] = function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            elseif cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
    }),

    formatting = {
        fields = { "abbr", "kind", "menu" }, -- specify order
        format = function(entry, vim_item)
            vim_item.kind = utils.symbols[vim_item.kind]
            vim_item.menu = entry.source.name
            return vim_item
        end,
    }
}
