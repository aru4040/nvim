return {
    {
        -- テーマ設定
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        -- 構文解析
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "rust", "javascript", "typescript", "python", "toml", "yaml", "c", "csv", "html", "css" },
                highlight = {
                    enable = true,
                },
                indent = { enable = true },
            })
        end,
    },
    {
        -- ブロックなどを自動で閉じる
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
                disable_filetype = { "TelescopePrompt", "vim" }
            })
        end,
    },
    {
        -- fuzzy finder
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                defaults = {
                    prompt_prefix = "> ",
                    selection_caret = ">> ",
                    sorting_strategy = "ascending",
                    layout_config = {
                        horizontal = { preview_width = 0.5 },
                    },
                },
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "ファイル検索" })
            vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "テキスト検索" })
            vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "バッファ検索" })
            vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "ヘルプ検索" })
        end,
    },
    {
        -- fuzzy finderの拡張 (高速化)
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
            require("telescope").load_extension("fzf")
        end,
    },
    {
        -- インデントの階層ラインを表示
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup({
                indent = {
                    char = "┆",
                }
            })
        end,
    },
    {
        -- ファイラー
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            window = {
                width = 30,
                position = "right"
            },
            git_status = {
                enabled = true,
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                },
            },
            event_handlers = {
                {
                    event = "file_open_requested",
                    handler = function()
                        require("neo-tree.command").execute({ action = "close" })
                    end,
                },
            },
            vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "ファイラーを開く" })
        },
        cmd = "Neotree",
    },
    -- {
    --     "nvim-lualine/lualine.nvim",
    --     dependencies = {
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     opts = {},
    --     event = "VeryLazy",
    -- },
    {
        -- git
        "lewis6991/gitsigns.nvim",
        config = true,
        event = { "BufReadPre", "BufNewFile" }
    },
}
