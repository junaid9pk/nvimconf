return {
    "praem90/nvim-phpcsf",
    config = function ()
        vim.api.nvim_create_augroup("phpcs", { clear = true })

        require("phpcs").setup({
            phpcs = "phpcs",
            phpcbf = "phpcbf",
            standard = "PSR12"
        })

        vim.api.nvim_create_autocmd({"BufWritePost", "BufReadPost", "InsertLeave"}, {
            group = "phpcs",
            pattern = "*.php",
            command = "lua require'phpcs'.cs()",
        })
        --
        -- automatically fix code
        --[[ vim.api.nvim_create_autocmd("BufWritePost", {
            group = "PHPCSGroup",
            pattern = "*.php",
            command = "lua require'phpcs'.cbf()",
        }) ]]

        vim.keymap.set("n", "<leader>lp", function() require("phpcs").cbf() end, {
            silent = true,
            noremap = true,
            desc = "PHP Fix"
        })
    end
}
