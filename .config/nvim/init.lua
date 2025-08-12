require("options")
require("autocmd")

require("rocks")

require("plugins.cmp")
require("plugins.lspconfig")
--require("plugins.dap")
--require("plugins.dapui")
--require("plugins.overseer")
require("plugins.telescope")
--require("plugins.alpha")
require("plugins.which-key")
--require("plugins.edgy")
--require("plugins.oil")
--require("plugins.copilot")
require("plugins.lualine")

require("vgit").setup()

require("keymap")

vim.g.rustaceanvim = {}

vim.cmd [[ colorscheme tokyonight ]]
