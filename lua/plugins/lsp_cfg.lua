local lsp_servers = {
    -- Lua
    "lua_ls",
    -- Rust
    "rust_analyzer",
    -- Python
    "pyright",
    "ruff",
    -- JavaScript
    "ts_ls",
    -- HTML
    "html",
    -- CSS
    "cssls",
    -- JSON
    "jsonls",
    -- yaml
    "taplo",
}

local formatters = {
    "djlint",
    "black",
    "isort",
    "stylua",
    "shfmt",
    "prettier",
}

local diagnostics = {
    "yamllint",
    "selene",
}

return {
    {
        -- LSP icons like VScode
        "onsails/lspkind.nvim",
        event = "InsertEnter",
    },
    {
        -- mason / mason-lspconfig / lspconfig
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "jay-babu/mason-null-ls.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason").setup({})
            require("mason-lspconfig").setup({
                -- lsp_servers table Install
                ensure_installed = lsp_servers,
            })

            local lsp_config = require("lspconfig")
            -- lsp_servers table setup
            for _, lsp_server in ipairs(lsp_servers) do
                lsp_config[lsp_server].setup({
                    root_dir = function(fname)
                        return lsp_config.util.find_git_ancestor(fname) or vim.fn.getcwd()
                    end,
                })
            end
        end,
        cmd = "Mason",
    },
    {
        -- mason-null-ls
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                automatic_setup = true,
                -- formatters table and diagnostic table Install
                ensure_installed = vim.tbl_flatten({ formatters, diagnostics }),
                handlers = {},
            })
        end,
        cmd = "Mason",
    },
    {
        -- none-ls
        "nvimtools/none-ls.nvim",
        requires = "nvim-lua/penary.nvim",
        config = function()
            local null_ls = require("null-ls")

            -- formatters table
            local formatting_sources = {}
            for _, tool in ipairs(formatters) do
                table.insert(formatting_sources, null_ls.builtins.formatting[tool])
            end

            -- diagnostics table
            local diagnostics_sources = {}
            for _, tool in ipairs(diagnostics) do
                table.insert(diagnostics_sources, null_ls.builtins.diagnostics[tool])
            end

            -- none-ls setup
            null_ls.setup({
                diagnostics_format = "[#{m} #{s} (#{c})]",
                sources = vim.tbl_flatten({ formatting_sources, diagnostics_sources }),
            })
        end,
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        -- lspsaga
        "nvimdev/lspsaga.nvim",
        config = function()
            require("lspsaga").setup({
                symbol_in_winbar = {
                    separator = " > ",
                },
            })
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        event = { "BufRead", "BufNewFile" },
    },
    {
        -- mason-nvim-dap: debug adapter protocol
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            ensure_installed = {
                "pyton",
            },
            handlers = {},
        },
    },
}
