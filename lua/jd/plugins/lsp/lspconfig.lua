return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            -- set keybinds
            opts.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

            opts.desc = "Show LSP type definitions"
            keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

            opts.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

            opts.desc = "Smart rename"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- configure html server
        lspconfig["html"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html", "blade" },
        })

        -- configure typescript server with plugin
        lspconfig["ts_ls"].setup({
            init_options = {
                plugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = SETTINGS.vue_typescript_plugin_path,
                        languages = {"javascript", "typescript", "vue"},
                    },
                },
            },
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                    on_attach(client, bufnr)
                    local filetype = vim.bo[bufnr].filetype

                    if filetype == "blade" then
                      client.server_capabilities.documentFormattingProvider = false
                    end
                end,
            settings = {
                diagnosticSeverity = "off",  -- Disables diagnostics (linting)
            },
            filetypes = {
                'javascript',
                'typescript',
                'javascriptreact',
                'typescriptreact',
                'vue',
                'json',
                'blade',
            },
        })

        -- configure volar vue-language-server with plugin
        lspconfig["volar"].setup({
            init_options = {
                typescript = {
                    tsdk = SETTINGS.typescript_path
                }
            },
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = {'vue'},
        })

        -- configure quick_lint_js server with plugin
        --[[ lspconfig["quick_lint_js"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                diagnosticSeverity="off",
            }
        }) ]]

        -- configure css server
        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure tailwindcss server
        lspconfig["tailwindcss"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
            init_options = {
                provideFormatter = true,
            },
        })

        -- configure omnisharp (c#)
        lspconfig["omnisharp"].setup({
            cmd = { "omnisharp" },
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "cs" },
        })

        -- configure intelephense
        lspconfig["intelephense"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "php", "blade" },
            settings = {
                intelephense = {
                    environment = {
                        phpVersion = "8.3",
                    },
                    stubFiles = {
                        vim.fn.expand("~/AppData/Local/nvim/stubs/laravel.stubs.php"),
                    },
                },
            },
        })

        -- configure python-lsp-server
        lspconfig["pylsp"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "python" },
            settings = { python = "python3" },
        })

        -- configure bash-lsp-server
        lspconfig["bashls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "sh" },
        })

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

    end,
}
