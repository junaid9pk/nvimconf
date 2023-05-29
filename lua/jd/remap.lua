vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)

-- system clipboard
vim.keymap.set("n", "<leader>sy", "\"+y")
vim.keymap.set("n", "<leader>sp", "\"+p")
vim.keymap.set("n", "<leader>sY", "\"+Y")

-- diagnostics
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
