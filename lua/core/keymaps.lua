-- windowの切り替え
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "左のwindowに切り替え" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "下のwindowに切り替え" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "上のwindowに切り替え" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "下のwindowに切り替え" })

-- windowの追加
vim.keymap.set("n", "<leader>v", ":Ve<CR>", { desc = "windowを左右に分割" })
vim.keymap.set("n", "<leader>s", ":Se<CR>", { desc = "windowを上下に分割" })
