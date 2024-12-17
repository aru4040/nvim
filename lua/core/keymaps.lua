-- windowの切り替え
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "左のwindowに切り替え" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "下のwindowに切り替え" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "上のwindowに切り替え" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "下のwindowに切り替え" })

-- windowの追加
vim.keymap.set("n", "<leader>v", ":vsp<CR>", { desc = "windowを左右に分割" })
vim.keymap.set("n", "<leader>s", ":sp<CR>", { desc = "windowを上下に分割" })

-- バッファの移動
vim.keymap.set("n", "[b", ":bprev<CR>", { desc = "前のバッファへ移動" })
vim.keymap.set("n", "]b", ":bnext<CR>", { desc = "次のバッファへ移動" })

-- LSP関連のキーマッピング
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- バッファローカルでのLSP設定
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Local Buffer Keymappings

        -- Diagnostic Keymappings

        -- Lspsaga Keymappings
    end,
})
