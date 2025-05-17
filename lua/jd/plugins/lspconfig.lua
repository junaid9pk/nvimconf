return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        -- Setup mason
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "html", "tsserver", "volar", "cssls", "tailwindcss",
                "emmet_ls", "omnisharp", "intelephense", "lua_ls", "clangd"
            },
            automatic_installation = true,
        })

        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local on_attach = function(client, bufnr)
            print(client)
            local opts = { noremap = true, silent = true, buffer = bufnr }

            vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
            vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
            vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Global diagnostic settings
        vim.diagnostic.config({
            virtual_text = { prefix = "●", spacing = 4 },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.HINT] = "󰠠 ",
                    [vim.diagnostic.severity.INFO] = " ",
                }
            },
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        vim.api.nvim_set_hl(0, "DiagnosticSignError", { link = "DiagnosticError" })
        vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { link = "DiagnosticWarn" })
        vim.api.nvim_set_hl(0, "DiagnosticSignHint", { link = "DiagnosticHint" })
        vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { link = "DiagnosticInfo" })

        local SETTINGS = _G.SETTINGS or {}

        -- Setup handlers manually (you can customize per server)
        local servers = {
            html = { filetypes = { "html", "blade" } },
            ts_ls = {
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = SETTINGS.vue_typescript_plugin_path or "",
                            languages = { "javascript", "typescript", "vue" },
                        },
                    },
                },
                filetypes = {
                    "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "json", "blade"
                },
                on_attach = function(client, bufnr)
                    on_attach(client, bufnr)
                    if vim.bo[bufnr].filetype == "blade" then
                        client.server_capabilities.documentFormattingProvider = false
                    end
                end
            },
            volar = {
                init_options = {
                    typescript = { tsdk = SETTINGS.typescript_path or "" },
                },
                filetypes = { "vue" }
            },
            cssls = {},
            tailwindcss = {},
            emmet_ls = {
                filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
                init_options = { provideFormatter = true },
            },
            omnisharp = {
                cmd = { "omnisharp", "--languageserver" },
                filetypes = { "cs", "vb" },
                root_markers = { ".sln", ".csproj", "omnisharp.json", "function.json" },
                settings = {
                    FormattingOptions = { EnableEditorConfigSupport = true },
                    Sdk = { IncludePrereleases = true },
                },
            },
            intelephense = {
                filetypes = { "php", "blade" },
                settings = {
                    intelephense = {
                        environment = { phpVersion = "8.3" },
                        stubFiles = {
                            vim.fn.expand("~/AppData/Local/nvim/stubs/laravel.stubs.php"),
                        },
                    },
                },
            },
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            },
            clangd = {
                filetypes = { "c", "cpp" },
                cmd = {
                    "clangd", "--background-index", "--clang-tidy", "--header-insertion=never"
                },
            },
        }

        for server, config in pairs(servers) do
            config.capabilities = capabilities
            config.on_attach = config.on_attach or on_attach
            lspconfig[server].setup(config)
        end
    end,
}
