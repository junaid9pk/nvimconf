return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function ()
        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.blade = {
          install_info = {
            url = "https://github.com/EmranMR/tree-sitter-blade",
            files = {"src/parser.c"},
            branch = "main",
          },
          filetype = "blade"
        }

        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "html",
                "javascript",
                "typescript",
                "lua",
                "vim",
                "bash",
                "sql",
                "c_sharp",
                "php",
                "blade"
            },
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true
            },
            incremental_selection = {
                enable = true,
            }
        })
    end
}
