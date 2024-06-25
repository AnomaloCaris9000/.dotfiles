local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local configspath = "plugins.configs."

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return {

    "simrat39/rust-tools.nvim",
    "mfussenegger/nvim-jdtls",
    "brenoprata10/nvim-highlight-colors",
    "christoomey/vim-tmux-navigator",

    -- nvim dap
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",

    "nvim-tree/nvim-web-devicons",

    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",

    "stevearc/overseer.nvim",
    "stevearc/dressing.nvim",
    "rcarriga/nvim-notify",

    -- TELESCOPE
    'nvim-telescope/telescope.nvim',
    "nvim-telescope/telescope-project.nvim",
    'nvim-lua/plenary.nvim',
    "BurntSushi/ripgrep",
    "nvim-telescope/telescope-dap.nvim",
    "FeiyouG/commander.nvim",
    "sshelll/telescope-switch.nvim",
    "LinArcX/telescope-command-palette.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    "OliverChao/telescope-picker-list.nvim",
    "jonarrien/telescope-cmdline.nvim",
    "albenisolmos/telescope-oil.nvim",


    "goolord/alpha-nvim",

    "folke/which-key.nvim",

    "folke/edgy.nvim",

    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",

    "github/copilot.vim",

    "stevearc/oil.nvim",

    "nvim-lualine/lualine.nvim",

    "epwalsh/obsidian.nvim",

    {
        "williamboman/mason-lspconfig.nvim",
        main = "mason-lspconfig",
        opts = {},
        configs = true,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "clang-format",
                "codelldb",
            },
        },
    },

    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },

    {
        "neovim/nvim-lspconfig",
        init = function()
            require("plugins.configs.lspconfig")
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        main   = "nvim-tree",
        event  = "VeryLazy",
        opts   = require("plugins.configs.nvim-tree"),
        config = true,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        main = "nvim-treesitter.configs",
        enabled = true,


        opts = require("plugins.configs.nvim-treesitter"),
        config = true,
    },

    {
        "nvim-treesitter/nvim-treesitter-refactor",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },


    {
        "jay-babu/mason-nvim-dap.nvim",
        enabled = true,
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
            ensure_installed = {
                "codelldb",
            },
        },
    },

    {
        "akinsho/toggleterm.nvim",
        enable = true,
        config = function()
            local main = "toggleterm"
            local toggleterm = require(main)
            local opts = require(configspath .. main)
            toggleterm.setup(opts)
            opts.after()
        end,
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        config = function()
            vim.cmd "colorscheme tokyonight"
        end,
    },
}
