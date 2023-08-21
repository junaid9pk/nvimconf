vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)

-- system clipboard
vim.keymap.set("n", "<leader>sy", "\"+y")
vim.keymap.set("n", "<leader>sp", "\"+p")
vim.keymap.set("n", "<leader>sY", "\"+Y")

-- tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>t<leader>", ":tabnext")
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

