-- system clipboard
vim.keymap.set("n", "<leader>y", '"+y')           -- Yank to system clipboard (normal mode)
vim.keymap.set("v", "<leader>y", '"+y')           -- Yank to system clipboard (visual mode)
vim.keymap.set("n", "<leader>Y", '"+Y')           -- Yank line to system clipboard
vim.keymap.set("n", "<leader>yy", '"+yy')         -- Explicit yank line alternative
vim.keymap.set("n", "<leader>p", '"+p')           -- Paste from system clipboard (after cursor)
vim.keymap.set("n", "<leader>P", '"+P')           -- Paste from system clipboard (before cursor)
vim.keymap.set("v", "<leader>p", '"+p')           -- Paste in visual mode
vim.keymap.set("n", "<leader>cp", '"+p')          -- Alternative paste mapping
vim.keymap.set("n", "<leader>cb", 'gg"+yG')       -- Copy WHOLE buffer (recommended new mapping)
vim.keymap.set("n", "<leader>cB", 'gg"+yG<C-o>')  -- Copy whole buffer and return to original position

-- move text
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tg", ":tabnext")
vim.keymap.set("n", "<leader>t<leader>", ":tabnext<CR>")
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>")
vim.keymap.set("n", "<leader>tm", ":tabmove")
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")
vim.keymap.set("n", "<leader>to", ":tabonly<CR>")

-- screen
vim.keymap.set("n", "<leader>wwi", "5<C-w>>")
vim.keymap.set("n", "<leader>wwd", "5<C-w><")
vim.keymap.set("n", "<leader>whi", "5<C-w>+")
vim.keymap.set("n", "<leader>whd", "5<C-w>-")

-- diagnostics
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })

-- remove carriage returns
vim.keymap.set("n", "<leader>cr", ":%s/\\r$//g<CR>", { desc = "Remove carriage returns" })
