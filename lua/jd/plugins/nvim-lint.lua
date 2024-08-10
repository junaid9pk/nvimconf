return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function ()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "quick-lint-js" },
            typescript = { "eslint_d" },
            php = { "phpcs", "phpstan", "tlint" },
            -- python = { "pylint" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })
    end

}
