vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)

-- system clipboard
vim.keymap.set("n", "<leader>sy", "\"+y")
vim.keymap.set("n", "<leader>sp", "\"+p")
vim.keymap.set("n", "<leader>sY", "\"+Y")

-- screen
vim.keymap.set("n", "<leader>wwi", "<C-w>><CR>")
vim.keymap.set("n", "<leader>wwd", "<C-w><<CR>")
vim.keymap.set("n", "<leader>whi", "<C-w>+<CR>")
vim.keymap.set("n", "<leader>whd", "<C-w>-<CR>")

-- diagnostics
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })

