return {
    "WhoIsSethDaniel/mason-tool-installer",
    dependencies = {
        "williamboman/mason.nvim",
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        require("mason-tool-installer").setup {
            ensure_installed = {
                -- LSP Servers
                "typescript-language-server",
                "vue-language-server",
                "css-lsp",
                "tailwindcss-language-server",
                "emmet-language-server",
                "omnisharp",
                "intelephense",
                "lua-language-server",
                "clangd",

                -- Formatters/Linters/DAPs
                "prettier",   -- JS/TS formatter
                "stylua",     -- Lua formatter
                "eslint_d",   -- JS/TS linter
                "phpcs",      -- PHP CodeSniffer
                "tlint",      -- PHP Tlint
                "phpstan",    -- PHP Static Analysis
                "pylint",     -- Python linter
                "clang-format",-- C/C++ formatter
            },
            auto_update = false,
            run_on_start = true,
        }
    end
}
