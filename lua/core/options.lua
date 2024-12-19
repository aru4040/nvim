-- 行番号を表示
vim.opt.number = true
-- 行番号を相対表示
vim.opt.relativenumber = true
-- テキストの折り返しを無効化
vim.opt.wrap = false

-- スワップファイルを作成しない
vim.opt.swapfile = false
-- バッファの切り替え時の未保存警告をオフ
vim.opt.hidden = true
-- registerとclipboardの共有
vim.opt.clipboard:append({ "unnamedplus" })

-- Tab文字が表示される際の幅を設定
vim.opt.tabstop = 4
-- TabやBackSpace時に動く幅を設定
vim.opt.softtabstop = 4
-- Tabの代わりにスペースを使う
vim.opt.expandtab = true
-- 前の行のインデントを引き継ぐ
vim.opt.autoindent = true
-- 構文に適したインデントを行う
vim.opt.smartindent = true
-- 自動インデントの幅を設定
vim.opt.shiftwidth = 4

-- カーソルがある行をハイライト
vim.opt.cursorline = true
-- 対応する括弧をハイライト
vim.opt.showmatch = true

-- 上下に余裕を持った表示にする
vim.opt.scrolloff = 4

-- 検索結果のハイライトを有効化
vim.opt.hlsearch = true
-- インクリメンタルサーチを有効化
vim.opt.incsearch = true

-- Windowの不透明度
vim.opt.winblend = 0
-- signカラムを表示
vim.opt.signcolumn = "yes"

-- 末尾に改行を追加
vim.opt.fixendofline = true
