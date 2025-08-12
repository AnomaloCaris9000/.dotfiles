local lspconfig = require("lspconfig")
local util = lspconfig.util

lspconfig.pyright.setup {}

lspconfig.ocamllsp.setup {
    cmd = { "ocamllsp" },
    arg = { "--fallback-read-dot-merlin", },
    root_dir = util.root_pattern({ ".", "dune-project" }),
}

lspconfig.clangd.setup {
    root_dir = util.root_pattern({ "." })
}

lspconfig.lua_ls.setup {}

lspconfig.rust_analyzer.setup {
    root_dir = util.root_pattern({ "Makefile", "Cargo.toml" })
}
