local ls = require("luasnip")

local snippets = {
    cpp = require("plugins.configs.luasnip.cpp")
}

for ft, snips in pairs(snippets) do
    ls.add_snippets(ft, snips)
end
