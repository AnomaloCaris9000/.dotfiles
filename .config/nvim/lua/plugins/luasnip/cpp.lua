local ls = require("luasnip")
local extras = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = extras.rep

return {
    s("hguard", fmt(
        [[
        #ifndef {}
        #define {}

        {}

        #endif // {}
    ]],
        { i(1), rep(1), i(0), rep(1) }
    )),

    s("main", fmt(
        [[
        int main(int argc, char **argv) {{
            {}
            return 0;
        }}
        ]],
        { i(0) }
    )),

    s("for", fmt(
        [[
        for({};{};{}) {{
            {}
        }}
        ]],
        { i(1), i(2), i(3), i(0) }
    )),
    s("fori", fmt(
        [[
        for(int i = 0; i < {}; i++) {{
            {}
        }}
        ]], { i(1), i(0) }
    )),
    s("func", fmt([[
        {} {}({}) {{
            {}
        }}
        ]],
        { i(1), i(2), i(3), i(0) }
    )),
    s("dowhile", fmt([[
        do {{
            {}
        }} while({})
        ]], { i(0), i(1) }))
}
