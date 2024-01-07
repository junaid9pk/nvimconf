-- system clipboard
vim.keymap.set("n", "<leader>sy", "\"+yy")
vim.keymap.set("n", "<leader>sp", "\"+p")
vim.keymap.set("v", "<leader>y", "\"+Y")

-- move text
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-k>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '<-2<CR>gv=gv")
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
