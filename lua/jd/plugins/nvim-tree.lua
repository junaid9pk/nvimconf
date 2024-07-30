return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require("nvim-tree").setup{
            view = {
                width = 40,
                number = true,
                relativenumber = true,
            },
            filters = {
                dotfiles = false,
            },
            git = {
                enable = true,
                ignore = false,
                timeout = 5000,
            }
        }

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
    end
}
