vim.opt.guicursor = ""
vim.opt.cursorline = true

vim.o.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 10

vim.g.mapleader = " "

vim.o.foldmethod = "expr"
vim.o.foldlevel = 3
vim.o.nofoldenable = true
vim.o.foldnestmax = 10
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

vim.o.undofile = true
